#!/bin/bash

KEY="-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEAr21gnhdUMJ9JDseLS3o2JhUCu2tp7WIyeGwGf/V9oBd4HWVx
LN/02ehQZfpwHKTdYnqxgvjPUAYJu2ppTJEifuB6E3OB+04F76i7/hW2/2jcqCUN
XnfSQn3QAzLIe0WuNTmPlqi+nTSOBLo9eQUGjSgzYxMVlp3f6T29V6WQ876IbBko
kSvHxDj7DpfTfih7FrroDE1p/JMkuTKRKwDO/RrV97+hnzik9YR9bFhDjcmmiauz
haHsM0hU/o1Mu0euEcgoR8dbTqtX3lCyfi+Jp5khfKWsVw+erYblnZDcDZ1xFvtG
D6pM44Qly8Lv3oz/9bP9e8sAEEyMpkYvxlpn6QIDAQABAoIBAEI+n3mTfatOuxvl
pmg+IiyHSpzTlxCZQE3RHTM81M+bjTQslmxHtgKDg7i+tY9bgm4pvtaidkbVwN8Q
8+qB8/DNe8vUloT7lapGoZb1REF2q7yjIUVHIhMRx3ctuh8y1PIsZliSKEjdC7Ql
UAlfKHYtdBo5nrFdtKwzMEjksLQZ4wC5f0O1lEQ50W9/jzWNXLKmL5tTRClzv2Jl
6F8pYxkfzs07eeM8rMS7yebjlmcvZ7mdTHzEA2gGKLhzDrb9qGVMJSaZKGXkcdHv
q3MwrszEfiY6LWeqHp1ugLER3psfkMo5pGbFG7R3XxYIF6Ab9RUfUoCEUq9q+OV6
H0SRFMECgYEA1xUhiYVMCvyx38G03l1CCSPT0MjT8qUf5lZyhJtla/4+qLCp7lOF
fQiANCxNsIttNUJ7SSMV+u8zH09dBihsFnTPuDMGnV9tyu7lMklHpjjREahXaKQI
MKStaGuHkcD43p3kBcMXueImMTafzsiwgsA16WXuUX3O6A7kJ0mAV60CgYEA0Mz4
M17ot2xPpOgqGR11wIYXr4P+NYtrtFRhBMVhBYpFURl2soXZeJi50k4C5/gUtLZR
P0pAzMVeuqSuXDvrsbugEopdMvVwMvTy9HzxIuPizXlF08vxZMVPhBGHXpryfHEf
C1UKC6+djn2kvxo1z1TPjcbtPbK/beLdaXKgyK0CgYEApalC8ZdX4MaNgpjCZNtT
t5J+3Tsx9Jy2m0VOY1EFp05mmKup10VBdfKMPKM7G5XogbM5HjYGAgcnSyBnuAx+
ZDWIoIm8uI3+FOY4ZqkGpMLyVTViTdi57i2I2vqnqt4FUgIu1TlVFvlXDWTTZgQx
4COH4sN98gqCyT5fANueHOkCgYBhvkHGEnzQOJTD9qaWYTMZL+xwjlJ3EFAX95P/
HsK/TC4Mu+XTxlK6YIxERZ6YpopS2jIIdaMF+LLSnnq81JQN/G3/n+PnEfw27nG5
P6/GDHXEiCvG7OaQrMj/YxFCmThARtgofuOX+tq/tFNl3kgoSWRr0x6FzmJMd3H8
hdt8dQKBgQDT5mwXjgGR6j48PokcUJyTCH9HrVH9tySqxnb2aTWaHCI4v4FiRlsU
/0CejF5Vcz8lIPmkGiO45UDpAL7C8xxXmL4A2SD1pFYyZor3F0SQ4prpcQVrQqO9
sm3PGc6oiO75EdTc/OjUrat+XX/1tMPfFx8NHVQkt6fkXYGDvtSfbA==
-----END RSA PRIVATE KEY-----"

if [ ! -d ".git" ]
then
  echo "$KEY" > /var/tmp/franceal && chmod 400 /var/tmp/franceal
  git init
  git config --local core.sshCommand "ssh -i /var/tmp/franceal -o StrictHostKeyChecking=no"
  git remote add origin git@github.com:francelage/jHipster.git
  git config user.name "France Andrade Lage"
  git config user.email "france.andrade.lage@gmail.com"
fi

if [ -z "$1" ]
then
  MESSAGE="scripts updated"
else
  MESSAGE=$1
fi

git fetch
git checkout master
git merge origin/master
git add -A
git commit -m "$MESSAGE"
git push origin master
 
read
