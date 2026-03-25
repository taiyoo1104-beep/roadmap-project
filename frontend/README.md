git clone https://github.com/taiyoo1104-beep/roadmap-project.git ./roadmap-project

cd roadmap-project


docker-compose up --build


docker-compose exec backend bin/rails db:prepare db:seed