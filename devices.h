/*
    Mac-Telnet - Connect to RouterOS or mactelnetd devices via MAC address
    Copyright (C) 2010, Håkon Nessjøen <haakon.nessjoen@gmail.com>

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/
extern int get_device_index(int sockfd, char *deviceName);
extern int get_device_mac(const int sockfd, const char *deviceName, unsigned char *mac);
extern int get_device_ip(const int sockfd, const char *deviceName, struct sockaddr_in *ip);
int get_ips(char *name, int nameLen, struct sockaddr_in *ip);
int get_macs(int sockfd, char *name, int name_len, unsigned char *mac);