# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# S3

1. setup s3 in config/deploy.yml
2. setup SSH connection with
   ```
   # ~/.ssh/config

   Host s3.kamal-testbed
     HostName 192.168.0.5
     ProxyJump kamal-testbed.online
     User root
     IdentityFile ~/.ssh/id_rsa
     Port 22
   ```

3. kamal server bootstrap -h 192.168.0.5
4. add to .kamal/secrets
   ```
   S3_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
   S3_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
   ```
5. export S3 and KAMAL_REGISTRY_PASSWORD vars to terminal
6. kamal registry login -h 192.168.0.5
7. kamal accessory boot s3
8. kamal server exec "chown 1001:1001 workshop-kamal2-s3/data" -h 192.168.0.5
9. test minio console
10. kamal server exec "docker exec kamal-proxy kamal-proxy deploy s3 --host s3.kamal-testbed.online --target 192.168.0.5:9000 --tls --health-check-path /minio/health/live" -h 87.228.32.111
11. kamal server exec "kamal server exec "docker exec kamal-proxy kamal-proxy list" -h 87.228.32.111
12. rails active_storage:install
13. rails db:migrate
14. add `gem "aws-sdk-s3", require: false`, uncomment `image_processing`, bundle
15. set `config/storage.yml`
16. set `config.active_storage.service` in `config/environments/production.rb`
17. add file upload and usage into code
