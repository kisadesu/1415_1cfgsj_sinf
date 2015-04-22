ls -1 $1/*.jpg > imagefiles
cat imagefiles


#Script
#Cuestion for the size of the new pictures
echo -e "\e[32mWhat dimensions for the image you want ?: \e[0m"
read tamano;
numeros='^[0-9]{1,5}+([x][0-9]{1,5}+)?$';	#Sanity Check for numbers
if ! [[ $tamano =~ $numeros ]];
	then echo "Error: The parameters entered for dimension were incorrect";
 	echo "Use: 200x200";
	exit 1;
fi

#Cuestion for know if the user want a new folther for imput the new images
echo -e "\e[32mDo you want imput the images in a new folder?: [yes/no]\e[0m"
read respuesta

#IF, for make a folder if the user whrite "yes", or create the images in her own folder if the user whrite "no"

 if ! [ "$respuesta" == "yes" -o "$respuesta" == "no" ];		#Sanity Check for yes/no
 	then echo "Error: The parameters entered for answer [yes/no] were incorrect"; 
	echo "Use: yes  or no";
	exit 1;
fi
if [ "$respuesta" == "yes" ]
		then
		
		echo -e "\e[32mInsert the name of the folder: \e[0m"
		read nombre


		mkdir /home/$USER/$nombre 
		mkdir /home/$USER/$nombre/Imágenes
		fi

echo -e "\e[32mChanging size of pictures..: \e[0m"

#take the images
while read imgfile
do
echo "IMG file: $imgfile";
lengthname=${#imgfile}
echo "Length: $lenthname";
namefile=${imgfile:0:$lengthname-4}
echo "namefile: $namefile";

#IF, for convert the images in the new folder or in the original folder
if [ "$respuesta" == "yes" ]
	then
	convert $imgfile -resize $tamano /home/$USER/$nombre/$namefile.png
		else
		convert $imgfile -resize $tamano $namefile.png
		echo -e "\e[32mImage created in the same folder. \e[0m"
	fi

done < imagefiles

#More coments for have the best script!!!
echo -e "\e[32mCompleted! \e[0m"
echo -e "\e[32mThe Script is finished, enjoy the pictures! \e[0m"
rm imagefiles
exit 0
