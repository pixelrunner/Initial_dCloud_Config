# from netmiko import ConnectHandler
import telnetlib
import time
import os
# import getpass
# import sys
import requests
import subprocess

TIMEOUT = 5 # set to 5 during normal operation or if manually debugging set to 1
PAUSE = 0.1
DEBUG = False


class Device:
    def __init__(self, name, ip, port, username, password, secret):
        self.ip = ip
        self.port = port
        self.username = username
        self.password = password
        self.secret = secret
        self.name = name

        self.conn = self.create_connection()

        if type(self.conn) != str:
            print('Connection made to ' + self.name)
        else:
            print('Connection not opened to ' + self.name + '.')


    def __exit__(self, exc_type, exc_val, exc_tb):
        #close the connection
        if not type(self.conn) == str:
            try:
                self.conn.close()
            except:
                print('Connection not closed to ' + self.name)


    def create_connection(self):
        # first just try and create a connection, if that fails, then troubleshoot!
        try:
            connection = telnetlib.Telnet(self.ip, self.port, timeout=TIMEOUT)
        except:
            print ('\nConnection failed to ' + self.name + ' switch. Clearing the lines. Please wait...', end = '')
            if self.name == 'Edge 2':
                response = requests.get('http://198.18.134.139/clear_line/edge_switch_1')
            elif self.name == 'Edge 1':
                response = requests.get('http://198.18.134.139/clear_line/edge_switch_0')
            elif self.name == 'Core':
                response = requests.get('http://198.18.134.139/clear_line/core')
            elif self.name == 'Fusion':
                response = requests.get('http://198.18.134.139/clear_line/fusion')
            else:
                return 'FAILED'

            # then try reconnecting
            countdown = 120
            while countdown > 0:
                try:
                    print('.', end = '')
                    if DEBUG: print('DEBUG: Countdown timer: ' + str(countdown))
                    if DEBUG: print('DEBUG: attempt connection')
                    connection = telnetlib.Telnet(self.ip, self.port, timeout=TIMEOUT)
                    break
                except:
                    countdown -= TIMEOUT
                    time.sleep(TIMEOUT)

            if countdown < 1:
                connection = 'FAILED'
            # print('Connection made to ' + self.name)
            print('.')
        return connection


    def send(self, command, response_needed):
        time.sleep(PAUSE)
        self.conn.write((command + '\n').encode('utf-8'))

        if response_needed:
            response = ''
            response += self.conn.read_until(b"--More--", timeout=TIMEOUT).decode('ascii')
            if response[-8:] == '--More--':
                while response[-8:] == '--More--':
                    self.conn.write(('\n').encode('utf-8'))
                    response += self.conn.read_until(b"--More--", timeout=TIMEOUT).decode('ascii')
            return response


    def config_mode(self):
        self.send(' en', False)
        self.send('conf t', False)

    def run_script(self, config_mode, filepath):
        if type(self.conn) != str:
            if config_mode:
                self.config_mode()

            with open(filepath) as script:
                line = script.readline()
                print('\nRunning script on ' + self.name + '...')
                counter = 0
                while line:
                    if DEBUG:
                        print('line: ' + str(counter) + ' : ' + line)
                    else:
                        print('.', end = '')
                    self.send(line, False)
                    line = script.readline()
                    counter += 1
            if config_mode:
                self.send('end', False)

            if not DEBUG: print('.')
        else:
            print('Script not run on ' + self.name + '. Connection not open to switch.')


def check_ping(ip):
    print('Testing dCloud connectivity... ', end='')
    with open(os.devnull, 'w') as DEVNULL:
        try:
            subprocess.check_call(
                ['ping', '-c', '2', ip],
                stdout=DEVNULL,  # suppress output
                stderr=DEVNULL
            )
            print('OK')
            return True
        except subprocess.CalledProcessError:
            print(' ')
            return False


def main():
    # check ping to server to make sure VPN is up
    if check_ping('198.18.128.96'):
        edge1 = Device('Edge 1', '198.18.128.96', 2024, 'dnacadmin', 'C1sco12345', 'C1sco12345')
        edge2 = Device('Edge 2', '198.18.128.96', 2025, 'dnacadmin', 'C1sco12345', 'C1sco12345')
        core = Device('Core', '198.18.128.96', 2023, 'dnacadmin', 'C1sco12345', 'C1sco12345')
        fusion = Device('Fusion', '198.18.128.96', 2022, 'dnacadmin', 'C1sco12345', 'C1sco12345')
        term_serv = Device('Terminal Services', '', 23, '', 'C1sco12345', 'C1sco12345')

        print('\n')

        edge1.run_script(True, './base_configs/Edge1a.txt')
        edge2.run_script(True, './base_configs/Edge2a.txt')
        core.run_script(True, './base_configs/Core.txt')
        fusion.run_script(True, './base_configs/Fusion.txt')

        print('\nAll scripts complete!')
    else:
        print('ConnectionError: Check the VPN and try again')

if __name__ == '__main__':
    main()

