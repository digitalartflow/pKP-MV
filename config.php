<?	

	############### CONNECTION WITH THE DATABASE ###############

	define( "DB_HOST"    , "demopkp2.db.6010387.hostedresource.com"           );  // type your database host

	define( "DB_USER"    , "demopkp2"            );  // type database user

	define( "DB_PASS"    , "Orange1!"              );  // your database password

	define( "DB_DATABASE", "demopkp2"    );  // your database name

	############################################################

	define("WEBSITE_URL", "http://manufacture.3dkitchenplanners.com/");  // type your URL

	define("LIVE_ADMIN_KEY", "L2845534CV5C62556M18F6984");  // type your live admin key, you can generate one here: https://www.purechat.com/

	define("WEBSITE_NOREPLY_EMAIL", "contact@digitalartflow.com");  

	define("WEBSITE_CONTACT_EMAIL", "contact@digitalartflow.com"); 

	############### DEFINE ADMIN VARS ##########################

	define("SERVER_PATH", getcwd());

	define("PROGRAM_PATH", SERVER_PATH);

	##################### DIVERSE ##############################	

	define("SECRET_PHRASE", "secretPhrase");

	

	function ConnectToDB()

	{

		mysql_connect  ( DB_HOST, DB_USER, DB_PASS ) or die ( "EROARE LA CONEXIUNE".mysql_error() );

		mysql_select_db( DB_DATABASE );

		mysql_query("SET NAMES utf8");

	}

	//mesage setting

	function ServerMSG( $content=false, $type="error", $timeout=5000, $id=false )

	{

		$smarty = $_SESSION['smarty'];

		if( empty( $_SESSION['msg'] ) && !$content ) return false;

		$msg            = array();

		$msg['id']      = $id ? $id : rand(999,99999);

		$msg['content'] = $content ? $content : $_SESSION['msg'];

		$msg['type']    = $type;

		$msg['timeout'] = $timeout;

		$_SESSION['msg'] = false;

		$smarty->assign('msg',$msg);

		return $smarty->fetch('objects/mesajServer.tpl');

	}

?>