verion=`python3 taptap.py`
if [ $version == `cat version_code.txt` ]
then
	echo "No update"
	exit
fi
wget -nv -O Phigros.apk `cat url.txt`
java -jar PhigrosMetadata-1.2.jar Phigros.apk
dotnet Il2CppDumper.dll libil2cpp.so global-metadata.dat .
dotnet DummyDllToPythonTemplate.dll -a DummyDll/Assembly-CSharp.dll -i DummyDll/Il2CppDummyDll.dll -p h.py
git clone https://github.com/7aGiven/Phigros_Resource/
cd Phigros_Resource
mv ../h.py .
echo $SUPER_SECRET\n > secret.txt
git config user.name "7aGiven"
git config user.email 'a@gmail.com'
git add .
git commit -m "Github Action"
git push < secret.txt
echo $version > version_code.txt
