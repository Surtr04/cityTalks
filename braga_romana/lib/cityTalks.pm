package cityTalks;
use Dancer ':syntax';
use strict;
use warnings;
use Sys::Hostname;
use Cwd;

our $VERSION = '0.1';

get '/deploy' => sub {
    template 'deployment_wizard', {
		directory => getcwd(),
		hostname  => hostname(),
		proxy_port=> 8000,
		cgi_type  => "fast",
		fast_static_files => 1,
	};
};



get '/' => sub {
    template 'welcome';
};

get '/index/:lang?' => sub {
    template 'index', {
        lang => param('lang') || 'pt',
    }
};

get '/baugusta/:lang?' => sub {
    template 'baugusta', {
        lang => param('lang') || 'pt',
    }
};

get '/follow' => sub {
    template 'follow';
};

get '/sevelhachoice' => sub {
    template 'sevelhachoice', {
        lang => param('lang') || 'pt',
    }
};

get '/sechoice' => sub {
    template 'sechoice', {
        lang => param('lang') || 'pt',
    }

};

get '/cividadechoice' => sub {
    template 'cividadechoice', {
        lang => param('lang') || 'pt',
    }

};

get '/insulachoice' => sub {
    template 'insulachoice', {
        lang => param('lang') || 'pt',
    }

};

get '/ddiogochoice' => sub {
    template 'ddiogochoice', {
        lang => param('lang') || 'pt',
    }

};

get '/idolochoice' => sub {
    template 'idolochoice', {
        lang => param('lang') || 'pt',
    }

};

get '/cantinhochoice' => sub {
    template 'cantinhochoice', {
        lang => param('lang') || 'pt',
    }

};

get '/craveirochoice' => sub {
    template 'craveirochoice', {
        lang => param('lang') || 'pt',
    }

};

get '/sevelha' => sub {
    template 'sevelha', {
        lang => param('lang') || 'pt',
    }

};

get '/se' => sub {
    template 'se', {
        lang => param('lang') || 'pt',
    }

};

get '/insula' => sub {
    template 'insula', {
        lang => param('lang') || 'pt',
    }

};

get '/cividade' => sub {
    template 'cividade', {
        lang => param('lang') || 'pt',
    }

};

get '/ddiogo' => sub {
    template 'ddiogo', {
        lang => param('lang') || 'pt',
    }

};

get '/craveiro' => sub {
    template 'craveiro', {
        lang => param('lang') || 'pt',
    }

};

get '/idolo' => sub {
    template 'idolo', {
        lang => param('lang') || 'pt',
    }

};

get '/cantinho' => sub {
    template 'cantinho', {
        lang => param('lang') || 'pt',
    }

};

get '/guide/:pname/:place/:lang?' => sub {
    template 'guide', {
        place => param('place'),
        pname => param('pname'),
        lang => param('lang') || 'pt',
    }
};

get '/end/:lang?' => sub {

    template 'end', {
        lang => param('lang') || 'pt'
    }

};

true;
