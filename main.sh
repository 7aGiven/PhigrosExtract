verion=`python3 taptap.py`
#if [ $version == `cat version_code.txt` ]
#then
#	echo "No update"
#	exit
#fi
wget -nv -O Phigros.apk `cat url.txt`
java -jar PhigrosMetadata-1.2.jar Phigros.apk
dotnet Il2CppDumper.dll libil2cpp.so global-metadata.dat .
dotnet DummyDllToPythonTemplate.dll -a DummyDll/Assembly-CSharp.dll -i DummyDll/Il2CppDummyDll.dll -p h.py
echo $version > version_code.txt
