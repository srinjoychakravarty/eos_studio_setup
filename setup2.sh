echo "Restarting docker service.."
sudo service docker restart
echo "Install dockerized eos v2.0.5 for EOS Studio? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
    	Yes ) docker pull eostudio/eos:v2.0.5; break;;
        No ) exit;;
    esac
done
echo "Install dockerized eosio cdt v1.7.0-rc1 for EOS Studio? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
    	Yes ) docker pull eostudio/eosio.cdt:v1.7.0-rc1; break;;
        No ) exit;;
    esac
done
echo "Download EOS Studio? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) wget https://download.eosstudio.io/linux -O EOSStudio.AppImage; break;;
        No ) exit;;
    esac
done
echo "Downloaded EOS Studio...Making EOS Studio executable!"
chmod +x EOSStudio.AppImage
echo "Start EOS Studio? [recommended]"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./EOSStudio.AppImage; break;;
        No ) exit;;
    esac
done