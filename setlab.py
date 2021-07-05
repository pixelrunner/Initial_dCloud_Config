import requests
import json
import time
import urllib3
urllib3.disable_warnings()
#urllib3.disable_warnings()
ip = "198.18.129.100"

"""GETTING AUTHENTICATION TOKEN"""
def get_token(dnac_ip):
    auth_uri="/dna/system/api/v1/auth/token"
    baseurl = f"https://{dnac_ip}"
    url = f"{baseurl}{auth_uri}"
    #print("PLEASE PROVIDE DNAC LOGIN CREDENTIALS")
    User = "admin"
    password = "C1sco12345"
    token = requests.post(url, auth=(User, password), verify=False).json()
    Token = token["Token"]
    return Token

Token = get_token(ip)
# headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}

"""GETTING SITES"""

def get_sites(dnac_ip, Token):
    site_url = "/dna/intent/api/v1/site"
    baseurl = f"https://{dnac_ip}"
    #Token = get_token(dnac_ip)
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    site_count = requests.get(f"{baseurl}{site_url}", headers=headers, verify=False).json()
    #print(json.dumps(site_count, indent=4))
    return site_count

sites = get_sites(ip, Token)
id_dict = {}

for item in sites["response"]:
    if item['name']=="North Carolina":
        id_dict[item['name']] = item['id']
    else:
        if item['name']=="RTP10":
            id_dict[item['name']] = item['id']
    


"""CREATING AND UPDATNG SITES"""

area1_payload = {
        "type": "area",
        "site": {
            "area": {
                "name": "United States",
                "parentName": "Global"
            }
        }    
    }

area2_payload = {
        "type": "area",
        "site": {
            "area": {
                "name": "North Carolina",
                "parentName": "Global/United States"
            }
        }    
    }


building_payload = {
    "type": "building",
    "site": {
        "building": {
            "name": "RTP10",
            "parentName": "Global/United States/North Carolina/RTP",
            "latitude": "35.86051961498",
            "longitude": "-78.88137963075685"
        }
    }
}


def create_sites(dnac_ip, Token, payload,method, siteId=""):
    
    site_url = f"https://{dnac_ip}/dna/intent/api/v1/site"
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    #site_headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json", "__runsync":"true", "__timeout": "30",}
    if method=="post":
        site_create = requests.post(site_url, headers=headers, json=payload, verify=False)
    else:
        if method=="put":
            site_url = f"https://{dnac_ip}/dna/intent/api/v1/site/{siteId}"
            site_create = requests.put(site_url, headers=headers, json=payload, verify=False)
    if site_create.status_code == 202:
        print("Site request successfully submitted ")
        exec_id = site_create.json()['executionId']
        execution_status_url = f"https://{dnac_ip}/dna/platform/management/business-api/v1/execution-status/{exec_id}"
        status = requests.get(execution_status_url, headers=headers, verify=False).json()
        while status['status']!='SUCCESS':
            #print(status['status'])
            print("Site creation/update in progress...")
            time.sleep(2)
            status = requests.get(execution_status_url, headers=headers, verify=False).json()
            if status['status']=='FAILURE':
                error = json.loads(status['bapiError'])
                print("Error creating site:", error['result']['result'])
            break
        if status['status']=='SUCCESS':
            print("SITE SUCCESSFULLY CREATED/UPDATED!")
            
    else:
        print("An unexpected error has occurred")
        print(site_create.json())
    # print("STATUS INFO: ")
    # print(status.json())
    #area_id = site_create.json()['siteId']
    return site_create.json()

print("Creating area 1: United States...")
United_States = create_sites(ip, Token, area1_payload, "post")

print("Updating area: North Carolina...")
North_Carolina = create_sites(ip, Token, area2_payload, "put",siteId=id_dict['North Carolina'])

print("Updating Building: RTP10...")
RTP_10 = create_sites(ip, Token, building_payload, "put", siteId=id_dict['RTP10'])
print("SITE HIERARCHY SUCESSFULLY UPDATED")


# """GETTING SITES"""
# sites = get_sites(ip, Token)
# #print(json.dumps(sites,indent=2))

# for item in sites['response']:
#     if item["name"] == "RTP10":

#         RTP_10_id = item["id"]
        
#         print("The site ID for RTP10 is: ", RTP_10_id)

"""CREATING CREDENTIALS.
# This script only creates SNMP credentials (Read and Write) because the dcloud lab already has the CLI credentials configured.
# """
def get_credentials(dnac_ip, Token):
    credentials_url = f"https://{dnac_ip}/dna/intent/api/v1/device-credential"
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    get_credentials = requests.get(credentials_url, headers=headers, verify=False).json()
    #print(json.dumps(get_credentials, indent=4))
    snmp_write_id = get_credentials["snmp_v2_write"][0]["id"]
    snmp_read_id = get_credentials["snmp_v2_read"][0]["id"]
    cli_id = get_credentials["cli"][0]["id"]
    return [snmp_write_id, snmp_read_id, cli_id]

def create_credentials(dnac_ip, Token, cred_payload):
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    cred_url = f"https://{dnac_ip}/dna/intent/api/v1/device-credential"
    cred_create = requests.post(cred_url, headers=headers, json=cred_payload, verify=False)
    if cred_create.status_code == 202:
        print("Credentials creation task successfully submitted")
        #print(json.dumps(cred_create, indent=4))
        exec_id = cred_create.json()["executionId"]
        status_url = f"https://{dnac_ip}/dna/platform/management/business-api/v1/execution-status/{exec_id}"
        status = requests.get(status_url, headers=headers, verify=False).json()
        #print("CREDENTIALS STATUS INFO: ", status)
        while status['status']!='SUCCESS':
            print("Creating SNMP credentials...")
            #print(status)
            time.sleep(2)
            status = requests.get(status_url, headers=headers, verify=False).json()
            if status['status']=='FAILURE':
                error = json.loads(status['bapiError'])
                print("Error creating credentials:", error['errorMessage'])
            break
        if status['status']=='SUCCESS':
            print("SNMP CREDENTIALS SUCCESSFULLY CREATED!")
            
    else:
        print("An unexpected error has occurred")
        print(cred_create.json())



cred_payload = {
    "settings": {
        
        "snmpV2cRead": [
            {
                "description": "defRO",
                "readCommunity": "cisco"
            }
        ],
        "snmpV2cWrite": [
            {
                "description": "defRW",
                "writeCommunity": "Cisco123"
            }
        ]
    }
}


print("Creating device credentials")
create_credentials(ip, Token, cred_payload)

"""CREATING DISCOVERIES
This creates two discovery tasks: "Edge_Discovery" and "Fusion&Core" and start discovering Edge, Core and Fusion switches.
"""

def discovery(dnac_ip, name, ip_range, Token):
    Discovery_url = f"https://{dnac_ip}/dna/intent/api/v1/discovery"
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    Discovery_payload = {
    "name": name,
    "discoveryType": "Range",
    "ipAddressList": ip_range,
    "protocolOrder": "ssh",
    "timeOut": 5,
    "retryCount": 3,
    "isAutoCdp": False,
    "globalCredentialIdList": get_credentials(dnac_ip, Token)
    }

    discovery = requests.post(Discovery_url, headers=headers, json=Discovery_payload, verify=False)
    if discovery.status_code == 202:
        discovery_json = discovery.json()
        print(f"Discovery '{name}' successfully created and started")
    #print(discovery)
    task_id = discovery_json['response']['taskId']

    #print(task_id)

    time.sleep(10)
    task_url = f"https://{dnac_ip}/dna/intent/api/v1/task/{task_id}"
    Discovery_task = requests.get(task_url, headers=headers, verify=False).json()
    #print("Disco Task is: ",Discovery_task)
    Discovery_id =  Discovery_task["response"]["id"]

    #print("Discovery successfully created. Discovery ID is: ", Discovery_id)
    return Discovery_id

print("Creating and starting discoveries...")
Edge_discovery = discovery(ip, "Edge_Discovery", "172.16.13.70-172.16.13.71", Token )
Core_discovery = discovery(ip, "Fusion&Core", "172.16.10.103-172.16.10.104", Token)

print("Waiting for discoveries to complete")
time.sleep(20)

"""ASSIGNING DEVICES TO RTP10"""

def get_devices(dnac_ip):
    device_url = f"https://{dnac_ip}/dna/intent/api/v1/network-device"
    #Token = get_token(dnac_ip)
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    devices = requests.get(device_url, headers=headers, verify=False).json()
    return devices

def assign_device(dnac_ip, assign_payload, siteId ):
    headers = {"x-auth-token":Token,"Content-type":"application/json","accept":"application/json"}
    assign_url = f"https://{dnac_ip}/dna/system/api/v1/site/{siteId}/device"
    assign = requests.post(assign_url, headers=headers, data = (json.dumps(assign_payload)), verify=False)
    if assign.status_code==202:
        print("Device assignment successfully submitted")
        #print(assign.json())
        execution_id = assign.json()['executionId']
        #print(execution_id)
        execution_status_url = f"https://{ip}/dna/platform/management/business-api/v1/execution-status/{execution_id}"
        execution_status = requests.get(execution_status_url, headers=headers, verify=False).json()
        while execution_status['status']!='SUCCESS':
            print("Assigning device")
            time.sleep(2)
            execution_status = requests.get(execution_status_url, headers=headers, verify=False).json()
            #print("Execution Status: ", execution_status)
        if execution_status['status']=='SUCCESS':
            print("Device Successfully assigned to site!")
    else:
        print("Unextpected error occurred assigning devices. Status code:", assign.status_code)
        print("Trying again...")
        devices = assign_device()
        return devices

devices = get_devices(ip)

check_list = {}
while len(check_list)<4:
    for item in devices['response']:
        #print(item['hostname'])
        #print(item['managementIpAddress'])
        check_list[item['hostname']] = item['managementIpAddress']
        print("Waiting for discoveries to complete...")
        time.sleep(2)
        devices = get_devices(ip)
        print(check_list)
if len(check_list)>=4:
    for item in check_list:
        print(f"assigning '{item}' to RTP10")
        assign_payload = {
        "device": [{"ip": check_list[item]}]
        }
        assign = assign_device(ip, assign_payload, siteId=id_dict['RTP10'])

print("YOUR LAB IS READY TO ROCK AND ROLL!!!")

