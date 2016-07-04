#!/usr/bin/env bats

DOCKER_COMPOSE_FILE="${BATS_TEST_DIRNAME}/php-7.0_fpm_pm_start_servers.yml"

container() {
  echo "$(docker-compose -f ${DOCKER_COMPOSE_FILE} ps php | grep php | awk '{ print $1 }')"
}

setup() {
  docker-compose -f "${DOCKER_COMPOSE_FILE}" up -d

  sleep 20
}

teardown() {
  docker-compose -f "${DOCKER_COMPOSE_FILE}" kill
  docker-compose -f "${DOCKER_COMPOSE_FILE}" rm --force
}

@test "php-7.0: fpm: pm.start_servers" {
  run docker exec "$(container)" /bin/su - root -mc "cat /usr/local/src/phpfarm/inst/current/etc/php-fpm.d/www.conf | grep 'pm.start_servers'"

  [ "${status}" -eq 0 ]
  [[ "${output}" == *"4"* ]]
}