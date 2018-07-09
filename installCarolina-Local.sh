  # carolina versions being installed
  CAROLINA_CORE_DL_URL="https://www.dullesresearch.com/software/carolina/3.7/carolina-3.7.5.tar.gz"
  CAROLINA_VER="3.7.5"
  CAROLINA_KERNEL="carolina_kernel-1.0.3.tar.gz"


  # target vars in hadoop cluster
  TARGET_HOME_DIR="/user-home/_global_/libs/ml/batch/thirdparty/carolina"
  #dsx: /user-home/_global_/libs/ml/batch/thirdparty/carolina/
  TARGET_JAVA_HOME_DIR="/usr"

  #create the target dir
  mkdir -p $TARGET_HOME_DIR/

  #download and extract carolina in target dir
  wget -O  $TARGET_HOME_DIR/carolina-$CAROLINA_VER.tar.gz $CAROLINA_CORE_DL_URL
  tar -xzf $TARGET_HOME_DIR/carolina-$CAROLINA_VER.tar.gz -C $TARGET_HOME_DIR


  #write license file
  echo "user         = mario.briggs@in.ibm.com" > $TARGET_HOME_DIR/carolina-$CAROLINA_VER/config/carolina.lic
  echo "company      = IBM" >> $TARGET_HOME_DIR/carolina-$CAROLINA_VER/config/carolina.lic
  echo "expiration   = 2018-12-31" >> $TARGET_HOME_DIR/carolina-$CAROLINA_VER/config/carolina.lic
  echo "version      = 3.7" >> $TARGET_HOME_DIR/carolina-$CAROLINA_VER/config/carolina.lic
  echo "capabilities = full,srl,srlmulti" >> $TARGET_HOME_DIR/carolina-$CAROLINA_VER/config/carolina.lic
  echo "signature    = AaC3CMb5V1gT55K8VISfJa/dxMylKsAF85nB5fMIoXnibB2hc39luR37MlqlZXXnigenQIqn4wct7edSiNAm7Q==" >> $TARGET_HOME_DIR/carolina-$CAROLINA_VER/config/carolina.lic

  #create carolina command file
  echo "#!/bin/sh" >> $TARGET_HOME_DIR/carolina.sh
  echo "exec /user-home/_global_/libs/ml/batch/thirdparty/carolina/carolina-$CAROLINA_VER/carolina \"\$@"\" >> $TARGET_HOME_DIR/carolina.sh
  chmod +x $TARGET_HOME_DIR/carolina.sh

  # download carolina kernel
  mkdir -p $TARGET_HOME_DIR/carolina-$CAROLINA_VER/plugins/jupyter
  wget -O $TARGET_HOME_DIR/carolina-$CAROLINA_VER/plugins/jupyter/$CAROLINA_KERNEL https://www.dullesresearch.com/software/carolina/jupyter/$CAROLINA_KERNEL
