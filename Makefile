ARG=
run:
	mkdir -p tmp/pids; touch log/development.log; echo "" > log/development.log; bundle exec foreman start -f Procfile.dev

console:
	bundle exec rails console
