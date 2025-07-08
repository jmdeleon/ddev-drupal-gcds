#!/bin/bash
mkdir drupal && cd drupal
ddev config --project-type=drupal11 --docroot=web
ddev start
ddev composer create-project drupal/cms
ddev composer config minimum-stability dev
ddev composer require --dev drush/drush
ddev drush site:install --account-name=admin --account-pass=pass -y
ddev composer require drupal/bilingual_enfr_recipe
ddev composer require drupal/gcds
ddev drush en -y twig_tweak twig_tools
ddev drush recipe /var/www/html/recipes/bilingual_enfr_recipe
ddev drush locale:check
ddev drush locale:update
ddev launch /user