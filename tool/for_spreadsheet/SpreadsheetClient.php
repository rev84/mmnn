<?php

require_once dirname(__FILE__).'/../vendor/autoload.php';

define('APPLICATION_NAME', 'mmnn data');
define('SCOPES', implode(' ', [
  Google_Service_Sheets::SPREADSHEETS_READONLY
]));
define('CLIENT_SECRET_PATH', dirname(__FILE__).'/client_secret.json');
define('CREDENTIALS_PATH', dirname(__FILE__).'/credentials.json');
define('PEM_FILE', dirname(__FILE__).'/cacert.pem');


class SpreadsheetClient
{
    protected static $_client = null;

    public static function getClient($isForceCreate = false)
    {
        if (!$isForceCreate && !is_null(static::$_client)) return static::$_client;

        $http = new \GuzzleHttp\Client([
            'verify' => PEM_FILE,
        ]);
        $client = new Google_Client();
        $client->setHttpClient($http);

        $client->setApplicationName(APPLICATION_NAME);
        $client->setScopes(SCOPES);
        $client->setAuthConfig(CLIENT_SECRET_PATH);
        $client->setAccessType('offline');
        $client->setApprovalPrompt('force');

        // Load previously authorized credentials from a file.
        $credentialsPath = static::expandHomeDirectory(CREDENTIALS_PATH);
        if (file_exists($credentialsPath)) {
            $accessToken = json_decode(file_get_contents($credentialsPath), true);
        }
        else {
            // Request authorization from the user.
            $authUrl = $client->createAuthUrl();
            printf("Open the following link in your browser:\n%s\n", $authUrl);
            print 'Enter verification code: ';
            $authCode = trim(fgets(STDIN));

            // Exchange authorization code for an access token.
            $accessToken = $client->fetchAccessTokenWithAuthCode($authCode);

            // Store the credentials to disk.
            if(!file_exists(dirname($credentialsPath))) {
                mkdir(dirname($credentialsPath), 0700, true);
            }
            file_put_contents($credentialsPath, json_encode($accessToken));
            printf("Credentials saved to %s\n", $credentialsPath);
        }
        $client->setAccessToken($accessToken);

        // Refresh the token if it's expired.
        if ($client->isAccessTokenExpired()) {
            $refreshTokenSaved = $client->getRefreshToken();
            $client->fetchAccessTokenWithRefreshToken($refreshTokenSaved);

            $accessTokenUpdated = $client->getAccessToken();
            $accessTokenUpdated['refresh_token'] = $refreshTokenSaved;
            
            $client->setAccessToken($refreshTokenSaved);
            file_put_contents($credentialsPath, json_encode($client->getAccessToken()));
        }
        static::$_client = $client;

        return static::$_client;
    }

    /**
     * Expands the home directory alias '~' to the full path.
     * @param string $path the path to expand.
     * @return string the expanded path.
     */
    protected static function expandHomeDirectory($path)
    {
        $homeDirectory = getenv('HOME');
        if (empty($homeDirectory)) {
            $homeDirectory = getenv('HOMEDRIVE') . getenv('HOMEPATH');
        }
        return str_replace('~', realpath($homeDirectory), $path);
    }

}