<?php
  function call($controller, $action) {
    require_once('controllers/' . $controller . '_controller.php');

    switch($controller) {
      case 'pages':
        $controller = new PagesController();
      break;  
      case 'companies':
        $controller = new CompanyController();
      break;
	  case 'contractors':
        require_once('models/contractor.php');
		$controller = new ContractorController();
      break;
	   case 'locations':
        require_once('models/locations.php');
		$controller = new LocationController();
      break;
    }

    $controller->{ $action }();
  }

  $controllers = array('home' 		=> ['home.view',],
                       'companies' 	=> ['company.view'],
					   'contractors' => ['contractor.view'],
					   'locations' 	=> ['location.view']);

  if (array_key_exists($controller, $controllers)) {
    if (in_array($action, $controllers[$controller])) {
      call($controller, $action);
    } else {
      call('home', 'home');
    }
  } else {
    call('home', 'home');
  }