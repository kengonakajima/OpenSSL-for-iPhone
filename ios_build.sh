./build-libssl.sh --version=1.0.1s

DATESTR=`date "+%Y%m%d%H%M"`
ZIPDIR=OpenSSL_1_0_1-stable-ios-${DATESTR}
ZIPDIRLATEST=OpenSSL_1_0_1-stable-ios-latest

rm -rf ${ZIPDIR} ${ZIPDIRLATEST}
mkdir ${ZIPDIR}
mkdir ${ZIPDIRLATEST}

cp -r lib ${ZIPDIRLATEST}
cp -r lib ${ZIPDIR}
cp -r include ${ZIPDIRLATEST}
cp -r include ${ZIPDIR}

zip -r ${ZIPDIR}.zip ${ZIPDIR}
zip -r ${ZIPDIRLATEST}.zip ${ZIPDIRLATEST}

aws s3 cp ${ZIPDIRLATEST}.zip s3://monobit/openssl/${ZIPDIRLATEST}.zip
aws s3 cp ${ZIPDIR}.zip s3://monobit/openssl/${ZIPDIR}.zip
aws s3 ls s3://monobit/openssl/

