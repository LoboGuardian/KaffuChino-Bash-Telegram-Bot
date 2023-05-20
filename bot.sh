#!/bin/bash
BOT="@KaffuChinoBot"
VER="v0.1"
#NEXT VERSION 0.2
#
# Send many files
# Now what url use for Document or Videos, and left you choice
# Make a DB of CHAT and ID
# Activate LOG
# Make it a demon

#TOKEN="YOUR_TOKEN_BOT" 
TOKEN= ${{ secrets.TOKEN }} 
CHAT="$1"
OPTION="$2"
FILE="$3" #Also use for message see message()

#LOG="envio_telegram_`date "+%d%m%Y"`.log"
#"echo" >> $LOG

#Init
clear
echo "$BOT $VER"
echo ""
echo "Do you want a tea or a coffee"
echo "Maybe a $BOT?"
echo ""


#Funcion para enviar mensajes ecritos desde la terminal
function message() {

   URL="https://api.telegram.org/bot$TOKEN/sendMessage"

   curl -s -X POST "$URL" -d chat_id="$ID" -d text="$FILE"
}

#Funcion para enviar/subir documentos en local
function uploadDocs() {

#  URL="https://api.telegram.org/bot$TOKEN/sendVideo"
  URL="https://api.telegram.org/bot$TOKEN/sendDocument"

  curl --fail -F chat_id="$ID" -F document=@"$FILE" $URL -X POST --progress-bar -o tmp --connect-timeout 0
}

case $OPTION in
   msg)
   echo "Enviando mensaje..."
   message
   echo "Mensaje enviado"
   echo ""
#   echo "Do you want to send another message?"
   ;;
   docs)
   echo "Subiendo archivo..."
   uploadDocs
   echo "Documento enviado"
   echo ""
#   echo "Do you want to send another document?"
   ;;
esac

echo "Have a nice day, $BOT <3"
