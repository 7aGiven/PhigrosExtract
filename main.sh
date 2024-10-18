set -e
version=`python3 taptap.py`
if [ "$version" = `cat version.txt` ]
then
	echo "No update"
	exit
fi
pip install UnityPy~=1.10.0
pip install fsb5
git clone --single-branch -b master https://$1@github.com/7aGiven/Phigros_Resource
wget -nv -O Phigros.apk `cat url.txt`
java -jar PhigrosMetadata-1.2.jar Phigros.apk
dotnet Il2CppDumper.dll libil2cpp.so global-metadata.dat .
dotnet DummyDllToPythonTemplate.dll -a DummyDll/Assembly-CSharp.dll -i DummyDll/Il2CppDummyDll.dll -p Phigros_Resource/h.py

cd Phigros_Resource
git commit -am "'$version'" && git push
git clone --no-checkout --single-branch -b info https://$1@github.com/7aGiven/Phigros_Resource info
git clone --no-checkout --single-branch -b avatar https://$1@github.com/7aGiven/Phigros_Resource avatar
git clone --no-checkout --single-branch -b illustration https://$1@github.com/7aGiven/Phigros_Resource illustration
git clone --no-checkout --single-branch -b illustrationBlur https://$1@github.com/7aGiven/Phigros_Resource illustrationBlur
git clone --no-checkout --single-branch -b illustrationLowRes https://$1@github.com/7aGiven/Phigros_Resource illustrationLowRes
python3 gameInformation.py ../Phigros.apk
python3 resource.py ../Phigros.apk

cd info
git add .
git commit -m "'$version'" && git push
cd ..

cd avatar
git add .
git commit -m "'$version'" && git push
cd ..

cd illustration
git add .
git commit -m "'$version'" && git push
cd ..

cd illustrationBlur
git add .
git commit -m "'$version'" && git push
cd ..

cd illustrationLowRes
git add .
git commit -m "'$version'" && git push
cd ..

cd ..
echo $version > version.txt
git commit -am "'$version'" && git push
