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


my $data = {

    aquamuseu => "Aquamuseu do Rio Minho",
    aquamuseu_en => "Aquamuseum of the Minho River",
    aro_en => "Archaeological Site of Lovelhe",
    aro => "Aro Arqueológico de Lovelhe",
    baluarte => "Baluarte de Santa Cruz",
    baluarte_en => "Sta. Cruz Bastion",
    capela_ajuda => "Capela de Nª Sª da Ajuda",
    capela_ajuda_en => "Nª Sª da Ajuda's Chapel",
    capela_s_roque => "Capela de S. Roque",
    capela_s_roque_en => "São Roque's Chapel",
    capela_s_sebastiao => "Capela de S. Sebastião",
    capela_s_sebastiao_en => "St. Sebastian Chapel",
    camara => "Casa da Câmara",
    camara_en => "Municipal House",
    castelo => "Castelo",
    castelo_en => "Castle",
    fonte => "Fonte da vila",
    fonte_en => "Town Fountain",
    forte => "Forte de Lovelhe",
    forte_en => "Fort of Lovelhe",
    forum => "Fórum Cultural",
    forum_em => "Cerveira Cultural Forum",
    misericordia => "Igreja da Misericordia",
    misericordia_en => "Misericórdia's Church",
    igreja_s_cipriano => "Igreja de S. Cipriano",
    igreja_s_cipriano_en => "São Cipriano's Church",
    memoria => "Memória",
    memoria_en => "Memory",
    pelourinho => "Pelourinho",
    pelourinho_en => "Pillory of Vila Nova de Cerveira",
    porta_traicao => "Porta da Traição",
    porta_traicao_en => "Door of Betrayal",
    solar => "Solar dos Castros",
    colar_en => "Solar dos Castros",
    torre_menagem => "Torre de Menagem",
    torre_menagem_en => "Menagem Tower",
};


get '/:lang?' => sub {
    template 'index', {
        lang => param('lang') || "pt",
    };
};

get '/locais/:lang?' => sub {
    template 'locais', {
        lang => param('lang') || "pt",
    }
};

get '/locais/:place/:lang?' => sub {

    template 'local', {
        place => param('place'),
        cw_data => $data,
        lang => param('lang') || "pt",
    };

};

get '/locais/assisted/:place/:lang?' => sub {

    template 'assisted', {
        place => param('place'),
        cw_data => $data,
        lang => param('lang') || "pt",
    }

};


#The user clicked "updated", generate new Apache/lighttpd/nginx stubs
post '/deploy' => sub {
    my $project_dir = param('input_project_directory') || "";
    my $hostname = param('input_hostname') || "" ;
    my $proxy_port = param('input_proxy_port') || "";
    my $cgi_type = param('input_cgi_type') || "fast";
    my $fast_static_files = param('input_fast_static_files') || 0;

    template 'deployment_wizard', {
		directory => $project_dir,
		hostname  => $hostname,
		proxy_port=> $proxy_port,
		cgi_type  => $cgi_type,
		fast_static_files => $fast_static_files,
	};
};

true;
