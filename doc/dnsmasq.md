# dnsmasq ����˵��

- �޸������ļ� /etc/dnsmasq.conf

    `nano /etc/dnsmasq.conf`

- ���ӵ����һ��

    ```

    enable-tftp
    tftp-root=/etc/dnsmasq.d/tftp/ipxe
    dhcp-match=set:bios,option:client-arch,0
    dhcp-match=set:ipxe,175
    dhcp-boot=tag:!ipxe,tag:bios,ipxeboot-undionly.kpxe
    dhcp-boot=tag:!ipxe,tag:!bios,ipxeboot-ipxe.efi
    dhcp-boot=tag:ipxe,boot.ipxe
    ```


- ����*nas*�µ��ļ���*tftp/ipxe*Ŀ¼��

    `scp -r /nas/ /etc/dnsmasq.d/tftp/`
