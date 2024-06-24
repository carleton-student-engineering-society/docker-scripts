#!/bin/bash
echo -n "Container Name: "
read name
echo -n "Domain: "
read domain

cp -r template_php/ $name
printf "#!/bin/bash\nexport NAME=\"$name\"\nexport DOMAIN=\"$domain\"\n" >> $name/rebuild.sh
cat $name/rebuild.sh.example >> $name/rebuild.sh
chmod +x $name/rebuild.sh

cd $name && ./rebuild.sh
