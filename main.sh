set -e
version=`python3 taptap.py`
if [ "$version" = `cat version_code.txt` ]
then
	echo "No update"
	exit
fi
cat url.txt
wget -nv -O Phigros.apk `cat url.txt`
java -jar PhigrosMetadata-1.2.jar Phigros.apk
dotnet Il2CppDumper.dll libil2cpp.so global-metadata.dat .
dotnet DummyDllToPythonTemplate.dll -a DummyDll/Assembly-CSharp.dll -i DummyDll/Il2CppDummyDll.dll -p h.py

cd ..
git clone https://$1@github.com/7aGiven/Phigros_Resource
cd Phigros_Resource
mv ../PhigrosAction/h.py .
echo 'Phigros_Resource push'
git commit -am "Github Action" && git push

cd ../PhigrosAction
echo $version > version_code.txt
echo 'PhigrosAction push'
git commit -am "Github Action" && git push
