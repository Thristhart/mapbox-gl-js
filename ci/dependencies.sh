# disable spotlight to ensure we waste no CPU on needless file indexing
if [[ $(uname -s) == 'Darwin' ]]; then sudo mdutil -i off /; fi;

if [[ ! -d ./nvm ]]; then
    git clone --depth 1 https://github.com/creationix/nvm.git ./nvm
fi

source ./nvm/nvm.sh

nvm install ${NODE_VERSION}
nvm use ${NODE_VERSION}

curl -o- -L https://yarnpkg.com/install.sh | bash

~/.yarn/bin/yarn

if [ "$CIRCLE_BRANCH" == "master" ] || [ -n "$CIRCLE_TAG" ]; then
    pip install --user --upgrade awscli
fi
