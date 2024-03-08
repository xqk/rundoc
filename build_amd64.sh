rm rundoc_linux_amd64 rundoc_linux_musl_amd64
rm -rf ../rundoc_linux_amd64/

export GOARCH=amd64
export GOOS=linux
export CC=/usr/bin/gcc

export TRAVIS_TAG=v2.1-beta.6

go mod tidy -v
go build -v -o rundoc_linux_amd64 -ldflags="-linkmode external -extldflags '-static' -w -X 'github.com/xqk/rundoc/conf.VERSION=$TRAVIS_TAG' -X 'github.com/xqk/rundoc/conf.BUILD_TIME=`date`' -X 'github.com/xqk/rundoc/conf.GO_VERSION=`go version`'"
./rundoc_linux_amd64 version

mkdir ../rundoc_linux_amd64
cp -r * ../rundoc_linux_amd64
cd ../rundoc_linux_amd64
rm -rf cache commands controllers converter .git .github graphics mail models routers utils runtime conf/*.go
rm appveyor.yml docker-compose.yml Dockerfile .travis.yml .gitattributes .gitignore go.mod go.sum main.go README.md simsun.ttc start.sh sync_host.sh build_amd64.sh build_musl_amd64.sh
zip -r rundoc_linux_amd64.zip conf static uploads views lib rundoc_linux_amd64 LICENSE.md
mv ./rundoc_linux_amd64.zip ../
