# docker-for-reproducibility
This is a repo to demo how to reproduce analysis results in `my_analysis.Rmd` in the docker container environment created by `Dockerfile` and copy the outputted report `my_analysis.html` to local host in Windows (optional).

Run below in Windows CMD to build the docker image: 
`docker build -t image-tag-name . `

run below in Windows CMD to spin up the docker container, and get back the html report: 
`mkdir outputs`
`docker run -v pwd\outputs:root/outputs image-tag-name`
