sudo growpart /dev/nvme0n1 4
sudo lvextend -r -l +100%FREE /dev/RootVG/homeVol
sudo xfs_growfs /home

sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin