cd ./frontend/todo-frontend
yarn build
aws s3 sync ./build s3://www.pyro.io
aws cloudfront create-invalidation --distribution-id EX5MW4IXVFXEA --paths / /index.html /error.html /service-worker.js /manifest.json /favicon.ico
