See: https://www.digitalocean.com/community/tutorials/how-to-run-end-to-end-tests-using-playwright-and-docker

docker build -t playwright-docker .

docker image ls

docker run --rm -v $(pwd)/playwright-report:/app/playwright-report playwright-docker

Browse to: http://localhost:5500/playwright-report/