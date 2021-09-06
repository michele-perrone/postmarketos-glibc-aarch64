# GNU C library for PostmarketOS
## What is this about?
PostmarketOS is a mobile-friendly GNU/Linux distribution based on Alpine Linux. Both Alpine and PostmarketOS come with the MUSL implementation of the C library. This can cause problems when trying to execute binaries that were linked against GNU implementation of the C Library (glibc). To mitigate this issue, Alpine provides gcompat in its repositories as the recommended GNU C compatibility layer compatibility layer. However, the implementation of certain library functions provided by gcompat may differ from glibc, which can cause runtime problems. In same cases, it is preferable to run glibc instead of gcompat. This repository provides pre-built glibc packages for aarch64 in .apk format, that can be easily installed by the end-user.
## Building
Building the .apk packages has to be done in two steps: compiling glibc and preparing the actual package. The main_script.sh takes care of the compilation and prepares a compressed tarball if you want to compile glibc yourself. Once the tarball is created, you are supposed to prepare the .apk package.
## Installing
The .apk packages are published in the releases of this repository. If you want to prepare the yourself, you should do that from your PostmarketOS device. First of all, clone yourself into this repository. Then simply run abuild -r to prepare the package. By the default, the package will be located in ~/packages/USER/aarch64, where USER is you user account. You can then install them as usual.
## Disclaimer
Please read all of the instructions. Bear in mind that this is still experimental. Don't install glibc unless you know what you're doing. This README is not polished yet and will be updated in the future with more detailed instructions.
