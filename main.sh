verion=`python3 taptap.py`
if [ "$version" = `cat version_code.txt` ]
then
	echo "No update"
	exit
fi

echo $1\n > secret.txt
git config --global user.name '7aGiven'
git config --global user.email 'a@gmail.com'
git config --global -l
git clone https://$1@github.com/7aGiven/Phigros_Resource/
cd Phigros_Resource
echo '1234' > t.txt
echo 0
git add .
echo 1
git commit -m "Gitub Action"
echo 2
git push < ../secret.txt
exit
wget -nv -O Phigros.apk `cat url.txt`
java -jar PhigrosMetadata-1.2.jar Phigros.apk
dotnet Il2CppDumper.dll libil2cpp.so global-metadata.dat .
dotnet DummyDllToPythonTemplate.dll -a DummyDll/Assembly-CSharp.dll -i DummyDll/Il2CppDummyDll.dll -p h.py
git clone https://github.com/7aGiven/Phigros_Resource/
cd Phigros_Resource
mv ../h.py .
echo $1\n > secret.txt
ls -l
git config --global user.name '7aGiven'
git config --global user.email 'a@gmail.com'
git config --global -l
echo 0
git add .
echo 1
git commit -m "Github Action"
echo 2
git push < `pwd`/secret.txt
echo $version > version_code.txt
