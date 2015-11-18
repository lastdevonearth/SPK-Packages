#! /usr/bin/env bash
export SPK_SOURCE_FOLDER=SickRage-spk
export SPK_NAME=SickRage
export SPK_VERSION=20151117-1
export SPK_ARCH=noarch

export FILE_NAME=${SPK_NAME}_${SPK_ARCH}_${SPK_VERSION}

# Remove previous package
rm -f ${SPK_NAME}_${SPK_ARCH}*.*

# Create a package.tgz from the contents of the package folder
cd ./${SPK_SOURCE_FOLDER}/package/
tar -cvzf ../package.tgz --exclude='.DS_Store' --exclude='.git' --exclude='@eaDir' --exclude='Thumbs.db' *

# Create the spk
cd ..
tar -cvf ../${FILE_NAME}.spk --exclude='package' --exclude='.DS_Store' --exclude='.git' --exclude='@eaDir' --exclude='Thumbs.db' *

# Clean up
rm package.tgz

# Create the nfo files
cp INFO ../${FILE_NAME}.nfo

# extract the logo
cp package/app/images/*72.png ../${FILE_NAME}_thumb_72.png 2>/dev/null
