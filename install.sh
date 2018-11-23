VivaldiInstall="/opt/vivaldi"
VivaldiResources="$VivaldiInstall/resources/vivaldi"

BrowserHtmlFile="$VivaldiResources/browser.html"

InitialCssMeta="<link rel=\"stylesheet\" href=\"style/common.css\" />"
ReplacementCssMeta="$InitialCssMeta<link rel=\"stylesheet\" href=\"style/elementaryos.css\" />"

echo "Stopping Vivaldi..."
pkill vivaldi

echo "Backing up browser HTML ($BrowserHtmlFile)..."
cp $BrowserHtmlFile "$BrowserHtmlFile.bak"

echo "Installing neccesary files..."
cp -r vivaldi/resources/ $VivaldiInstall

echo "Modifying browser HTML to include elementaryOS CSS tweaks..."
if ! grep -q "$ReplacementCssMeta" "$BrowserHtmlFile"; then
    sed -i "s|$InitialCssMeta|$ReplacementCssMeta|" $BrowserHtmlFile
else
    echo "Skipping previous step: Modifications already applied."
fi

echo "Done!"