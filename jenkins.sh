# env variable
JOB_NAME=${JOB_NAME}
BUILD_ID=${BUILD_ID}
export DATE=`date '+%Y-%m-%d_%H-%M'`

#docker 저장소 접속
docker login -u admin -p admin123 localhost:6000

#docker image build
docker build --tag localhost:6000/python_app:${JOB_NAME}-${BUILD_ID}-${DATE} .

#docker image push
docker push localhost:6000/python_app:${JOB_NAME}-${BUILD_ID}-${DATE}

docker-compose stop 
docker-compose rm -f 
docker-compose pull
docker-compose up -d
