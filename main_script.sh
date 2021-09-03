# The purpose of this script is to build the apk glibc packages
# ready to installed on a postmarketos machine.

# Environment variables
GLIBC_VERSION=2.34
PREFIX_DIR=/usr/glibc-compat
COMPILER=aarch64-linux-gnu-gcc
ARCH=aarch64
N_JOBS=4

# Fetch latest glibc and create build directory
git clone https://sourceware.org/git/glibc.git && cd glibcm
git checkout release/${GLIBC_VERSION}/master
cd .. && mkdir glibc-build-aarch64 && cd glibc-build-aarch64

# Configure glibc (remember we're in the build directory now)
cp ../configparams configparams 
../glibc/configure CC=${COMPILER} --build=x86_64-pc-linux-gnu --host=aarch64-linux-gnu --prefix="${PREFIX_DIR}" --libdir="${PREFIX_DIR}/lib" --libexecdir="/${PREFIX_DIR}/lib"

# Compile glibc and create the tarball
make -j${N_JOBS} && sudo make install
tar --dereference --hard-dereference -zcf "glibc-bin-${GLIBC_VERSION}-${ARCH}.tar.gz" "${PREFIX_DIR}"

# Create the apk packages
#cd .. && abuild -rf
