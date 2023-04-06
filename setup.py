import setuptools
setuptools.setup(name='mypackage',
version='0.1',
description='Package for demo',
url='#',
author='gmbmx',
install_requires=['requests','polars','datetime','selenium'],
author_email='guillermo@zophia.io',
packages=setuptools.find_packages(),
zip_safe=False)