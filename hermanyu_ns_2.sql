-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `album`;
CREATE TABLE `album` (
  `alb_id` int(11) NOT NULL AUTO_INCREMENT,
  `alb_ruta_amigable` varchar(255) NOT NULL,
  `alb_nombre` varchar(255) NOT NULL,
  `alb_descripcion` varchar(255) NOT NULL,
  `alb_ubicacion` varchar(255) NOT NULL,
  `alb_tags` varchar(255) NOT NULL,
  `alb_etiquetados` varchar(255) NOT NULL,
  `alb_fecha` date NOT NULL,
  `alb_usuario` int(11) NOT NULL,
  `alb_activar` int(11) NOT NULL,
  PRIMARY KEY (`alb_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `album` (`alb_id`, `alb_ruta_amigable`, `alb_nombre`, `alb_descripcion`, `alb_ubicacion`, `alb_tags`, `alb_etiquetados`, `alb_fecha`, `alb_usuario`, `alb_activar`) VALUES
(1,	'album 1',	'album-1',	'',	'',	'asd',	'',	'2017-07-01',	1,	1);

DROP TABLE IF EXISTS `album_multimedia`;
CREATE TABLE `album_multimedia` (
  `alb_mul_alb_id` int(11) NOT NULL,
  `alb_mul_mul_id` int(11) NOT NULL,
  `alb_mul_orden` int(11) NOT NULL,
  PRIMARY KEY (`alb_mul_mul_id`,`alb_mul_alb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `album_multimedia` (`alb_mul_alb_id`, `alb_mul_mul_id`, `alb_mul_orden`) VALUES
(1,	11,	0),
(1,	13,	1);

DROP TABLE IF EXISTS `aplicacion`;
CREATE TABLE `aplicacion` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_nombre` varchar(140) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `app_descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `app_ruta_amigable` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `app_nav_url` varchar(150) CHARACTER SET ucs2 COLLATE ucs2_spanish_ci NOT NULL,
  `app_url` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `app_icono` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `app_color` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `app_orden` int(11) NOT NULL,
  `app_activar` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `aplicacion` (`app_id`, `app_nombre`, `app_descripcion`, `app_ruta_amigable`, `app_nav_url`, `app_url`, `app_icono`, `app_color`, `app_orden`, `app_activar`) VALUES
(1,	'Mensajes',	'',	'',	'',	'',	'icn-comment',	'#2D9EE0',	0,	0),
(2,	'Alertas',	'',	'',	'',	'',	'',	'',	0,	0),
(3,	'Calendarios',	'',	'',	'',	'',	'',	'',	0,	0);

DROP TABLE IF EXISTS `autor`;
CREATE TABLE `autor` (
  `aut_id` int(11) NOT NULL AUTO_INCREMENT,
  `aut_nombre` varchar(100) NOT NULL,
  `aut_descripcion` tinytext NOT NULL,
  `aut_descripcion_larga` text NOT NULL,
  `aut_activar` int(11) NOT NULL,
  PRIMARY KEY (`aut_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calendario`;
CREATE TABLE `calendario` (
  `cal_id` int(11) NOT NULL AUTO_INCREMENT,
  `cal_nombre` varchar(150) NOT NULL,
  `cal_ruta_amigable` varchar(255) NOT NULL,
  `cal_descripcion` varchar(255) NOT NULL,
  `cal_color` varchar(20) NOT NULL,
  `cal_papelera` int(11) NOT NULL,
  `cal_usuario` int(11) NOT NULL,
  `cal_activar` int(11) NOT NULL,
  PRIMARY KEY (`cal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `calendario_categoria`;
CREATE TABLE `calendario_categoria` (
  `cal_cat_id_cal` int(11) NOT NULL,
  `cal_cat_id_cat` int(11) NOT NULL,
  PRIMARY KEY (`cal_cat_id_cal`,`cal_cat_id_cat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `calendario_grupo`;
CREATE TABLE `calendario_grupo` (
  `cal_grp_id_cal` int(11) NOT NULL,
  `cal_grp_id_grp` int(11) NOT NULL,
  PRIMARY KEY (`cal_grp_id_cal`,`cal_grp_id_grp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_nombre` varchar(250) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cat_descripcion` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cat_ruta_amigable` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cat_imagen` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cat_icono` varchar(45) CHARACTER SET utf8 NOT NULL,
  `cat_color` varchar(7) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cat_codigos` text CHARACTER SET utf8 NOT NULL,
  `cat_css` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_clase` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_meta` text COLLATE utf8_spanish_ci NOT NULL,
  `cat_theme` text COLLATE utf8_spanish_ci NOT NULL,
  `cat_id_padre` int(11) NOT NULL DEFAULT '0',
  `cat_id_plantilla` int(11) NOT NULL DEFAULT '1',
  `cat_orden` int(11) NOT NULL DEFAULT '0',
  `cat_tipo` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `cat_url` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_destino` varchar(20) COLLATE utf8_spanish_ci NOT NULL DEFAULT '_self',
  `cat_favicon` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_analitica` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_ruta_sitio` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cat_dominio` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `cat_activar` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cat_id`),
  FULLTEXT KEY `busqueda` (`cat_nombre`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=DYNAMIC;

INSERT INTO `categoria` (`cat_id`, `cat_nombre`, `cat_descripcion`, `cat_ruta_amigable`, `cat_imagen`, `cat_icono`, `cat_color`, `cat_codigos`, `cat_css`, `cat_clase`, `cat_meta`, `cat_theme`, `cat_id_padre`, `cat_id_plantilla`, `cat_orden`, `cat_tipo`, `cat_url`, `cat_destino`, `cat_favicon`, `cat_analitica`, `cat_ruta_sitio`, `cat_dominio`, `cat_activar`) VALUES
(1,	'Portada',	'',	'portada',	'',	'',	'',	'',	'',	'',	'',	'',	0,	1,	1,	'0',	'',	'_self',	'',	'',	'',	'',	1);

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
  `com_id` int(11) NOT NULL AUTO_INCREMENT,
  `com_texto` text CHARACTER SET latin1 NOT NULL,
  `com_usuario` int(11) NOT NULL,
  `com_fecha` datetime NOT NULL,
  `com_activar` int(11) NOT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

INSERT INTO `comentario` (`com_id`, `com_texto`, `com_usuario`, `com_fecha`, `com_activar`) VALUES
(1,	'hola mundo',	1,	'2016-08-11 00:08:47',	1),
(2,	'ya tenemos  la base de comentarios :D',	1,	'2016-08-11 00:08:33',	1);

DROP TABLE IF EXISTS `configuracion`;
CREATE TABLE `configuracion` (
  `conf_nombre_sitio` varchar(255) CHARACTER SET utf8 NOT NULL,
  `conf_imagen` varchar(255) CHARACTER SET utf8 NOT NULL,
  `conf_favicon` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `conf_script_head` text CHARACTER SET utf8 NOT NULL,
  `conf_script_footer` text CHARACTER SET utf8 NOT NULL,
  `conf_meta` varchar(255) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`conf_nombre_sitio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

INSERT INTO `configuracion` (`conf_nombre_sitio`, `conf_imagen`, `conf_favicon`, `conf_script_head`, `conf_script_footer`, `conf_meta`) VALUES
('Intranet Networks Solutions ',	'images/logo.png',	'images/favicon.png',	'',	'',	'modulos/meta.pub.php');

DROP TABLE IF EXISTS `contenedor`;
CREATE TABLE `contenedor` (
  `cont_id` int(11) NOT NULL AUTO_INCREMENT,
  `cont_nombre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cont_clase` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cont_css` varchar(255) CHARACTER SET utf8 NOT NULL,
  `cont_codigos` text CHARACTER SET utf8 NOT NULL,
  `cont_id_padre` int(11) NOT NULL,
  `cont_orden` int(11) NOT NULL DEFAULT '1',
  `cont_activar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cont_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

INSERT INTO `contenedor` (`cont_id`, `cont_nombre`, `cont_clase`, `cont_css`, `cont_codigos`, `cont_id_padre`, `cont_orden`, `cont_activar`) VALUES
(1,	'diagrama_general',	'',	'',	'',	0,	1,	1),
(2,	'diagrama_2',	'clase',	'css',	'codigos',	0,	2,	1),
(3,	'cabecera',	'container',	'',	'',	1,	0,	1),
(4,	'cuerpo',	'',	'',	'',	1,	0,	1),
(5,	'pie',	'',	'',	'',	1,	0,	1);

DROP TABLE IF EXISTS `contenedor_plantilla`;
CREATE TABLE `contenedor_plantilla` (
  `contenedor_cont_id` int(11) NOT NULL,
  `plantilla_pla_id` int(11) NOT NULL,
  PRIMARY KEY (`contenedor_cont_id`,`plantilla_pla_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

INSERT INTO `contenedor_plantilla` (`contenedor_cont_id`, `plantilla_pla_id`) VALUES
(1,	1),
(1,	2),
(1,	3);

DROP TABLE IF EXISTS `contenido`;
CREATE TABLE `contenido` (
  `conte_id` int(11) NOT NULL AUTO_INCREMENT,
  `conte_titulo` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `conte_ruta_amigable` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `conte_subtitulo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `conte_cuerpo` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `conte_foto` varchar(250) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `conte_fecha` datetime NOT NULL,
  `conte_id_usuario` int(11) NOT NULL,
  `conte_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `conte_id_dominio` int(11) NOT NULL,
  `conte_clase` varchar(255) NOT NULL,
  `conte_activar_titulo` int(1) NOT NULL,
  `conte_activar` int(1) NOT NULL,
  PRIMARY KEY (`conte_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `contenido` (`conte_id`, `conte_titulo`, `conte_ruta_amigable`, `conte_subtitulo`, `conte_cuerpo`, `conte_foto`, `conte_fecha`, `conte_id_usuario`, `conte_tag`, `conte_id_dominio`, `conte_clase`, `conte_activar_titulo`, `conte_activar`) VALUES
(1,	'sobre nosotros',	'sobre-nosotros',	'',	'<h3 class=\"label-intro\" style=\"font-family: shpro-light, arial, serif; color: rgb(51, 51, 51); text-align: justify;\">Creando desde 1925…</h3><p><span style=\"color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\">Nuestra experiencia con cuatro generaciones de trabajo hasta la fecha, tiene sus inicios en la ciudad de Santa Cruz de la Sierra el año 1925; con la iniciativa del Sr. Santiago Sauto quien realiza el proceso de pan con harina de trigo y aplica por primera vez en la ciudad, el manejo de la levadura en panificación. Con el tiempo se hace cargo de la empresa Eduardo Sauto, hijo mayor de la familia, siguiendo la fabricación de forma artesanal. Con el emprendimiento creativo de su esposa Nelly Vaca, dan inicio a la diversificación de los productos y al mejoramiento tecnológico con la compra de maquinaria moderna. Posteriormente se incorpora a la empresa Javier Sauto, consolidando el crecimiento y mejora constante. El 14 de octubre de 1985 al retirarse la pareja, los hijos: Maria Nelly, Victoria y Javier Sauto conforman una nueva sociedad y nace la razón social Panadería Victoria Ltda., dando paso a una renovación de la empresa con nuevos equipos, a la diversificación de productos en panadería y dando inicio a la producción en pastelería. En el año 1998 se inaugura una nueva planta Industrial, con maquinaria totalmente nueva, logrando construir una fábrica modelo de panificación. La cuarta generación, con Greta y Carolina y Gabriela Banzer Sauto, ha dado un impulso a la línea de repostería y confitería, desarrollando nuevos productos para eventos infantiles y de fiesta. Actualmente, estamos trabajando en nuevos proyectos sobre futuras ampliaciones, tanto en panadería como en pastelería en otros sectores de la ciudad.</span></p><p style=\"margin-bottom: 25px; color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\"></p><p style=\"margin-bottom: 25px; color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\"></p><h3 style=\"font-family: shpro-light, arial, serif; color: rgb(51, 51, 51); text-align: justify;\">Nuestra Misión</h3><p><span style=\"color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\">Panadería Victoria elabora productos de panificación y pastelería con materia prima de excelente calidad, procesos operativos estandarizados, brindando asesoramiento en la compra de los productos, por el conocimiento de las preferencias de sus clientes, satisfaciendo sus necesidades, a través de la capacitación constante del personal y la mejora continua, avalados por más de 90 años de experiencia y con el mismo cariño de siempre.</span></p><p style=\"margin-bottom: 25px; color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\"></p><p style=\"margin-bottom: 25px; color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\"></p><h3 style=\"font-family: shpro-light, arial, serif; color: rgb(51, 51, 51); text-align: justify;\">Nuestra Visión</h3><p><span style=\"color: rgb(51, 51, 51); font-family: shpro-light, arial, serif; text-align: justify;\">Ser una empresa eficiente, rentable, líder en el mercado cruceño en panificación y pastelería, con productos y servicios de excelente calidad. a través de: procesos productivos estandarizados, personal capacitado y comprometido, mejor infraestructura del país y sistemas de gestión e informático integrados.</span><br></p>',	'',	'2016-10-31 05:43:00',	1,	'',	0,	'',	0,	1);

DROP TABLE IF EXISTS `contenido_categorias`;
CREATE TABLE `contenido_categorias` (
  `conte_cat_conte_id` int(11) NOT NULL,
  `conte_cat_cat_id` int(11) NOT NULL,
  `conte_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`conte_cat_conte_id`,`conte_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `contenido_categorias` (`conte_cat_conte_id`, `conte_cat_cat_id`, `conte_cat_orden`) VALUES
(1,	76,	0);

DROP TABLE IF EXISTS `contenido_documentos`;
CREATE TABLE `contenido_documentos` (
  `conte_doc_conte_id` int(11) NOT NULL,
  `conte_doc_doc_id` int(11) NOT NULL,
  `conte_doc_orden` int(11) NOT NULL,
  PRIMARY KEY (`conte_doc_conte_id`,`conte_doc_doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `contenido_multimedia`;
CREATE TABLE `contenido_multimedia` (
  `conte_mul_conte_id` int(11) NOT NULL,
  `conte_mul_mul_id` int(11) NOT NULL,
  `conte_mul_orden` int(11) NOT NULL,
  PRIMARY KEY (`conte_mul_conte_id`,`conte_mul_mul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cron_jobs`;
CREATE TABLE `cron_jobs` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `cron_fecha` datetime NOT NULL,
  `cron_total` int(11) NOT NULL,
  `cron_num` int(11) NOT NULL,
  `cron_accion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `cron_id_accion` int(11) NOT NULL,
  `cron_estado` int(1) NOT NULL,
  PRIMARY KEY (`cron_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `cuenta`;
CREATE TABLE `cuenta` (
  `cuenta_id` int(11) NOT NULL AUTO_INCREMENT,
  `cuenta_tipo` int(11) NOT NULL,
  PRIMARY KEY (`cuenta_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `documento`;
CREATE TABLE `documento` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `doc_nombre` varchar(255) NOT NULL,
  `doc_ruta_amigable` varchar(255) NOT NULL,
  `doc_descripcion` text NOT NULL,
  `doc_url` varchar(255) NOT NULL,
  `doc_imagen` varchar(255) NOT NULL,
  `doc_tipo_archivo` varchar(255) CHARACTER SET utf32 NOT NULL,
  `doc_tamano` varchar(255) CHARACTER SET utf16 NOT NULL,
  `doc_tags` varchar(255) NOT NULL,
  `doc_fecha` date NOT NULL,
  `doc_usuario` int(11) NOT NULL,
  `doc_id_dominio` int(11) NOT NULL,
  `doc_orden` int(11) NOT NULL,
  `doc_activar` int(11) NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `documento` (`doc_id`, `doc_nombre`, `doc_ruta_amigable`, `doc_descripcion`, `doc_url`, `doc_imagen`, `doc_tipo_archivo`, `doc_tamano`, `doc_tags`, `doc_fecha`, `doc_usuario`, `doc_id_dominio`, `doc_orden`, `doc_activar`) VALUES
(6,	'como participarx',	'como-participar',	'',	'archivos/docs/como-participar.docx',	'',	'????',	'1㌳㐹',	'',	'2017-07-03',	1,	0,	0,	1),
(7,	'wen nuevax',	'wen-nueva',	'',	'archivos/docs/wen-nueva.pptx',	'',	'????',	'㈱〲㐹',	'',	'2017-07-03',	1,	0,	0,	1),
(8,	'caja de ahorro ganadoblex',	'caja-de-ahorro-ganadoble',	'',	'archivos/docs/caja-de-ahorro-ganadoble.docx',	'',	'????',	'1㔳㌴',	'',	'2017-07-03',	1,	0,	0,	1),
(9,	'bg-v2',	'bg-v2',	'',	'archivos/docs/bg-v2.pdf',	'',	'?',	'㄰㘱〴',	'',	'2017-07-03',	1,	0,	0,	1),
(10,	'plantilla datos medley_conci_abril19x cintura como',	'plantilla-datos-medley_conci_abril19',	'',	'archivos/docs/plantilla-datos-medley_conci_abril19.xlsx',	'',	'????',	'2㜰㌵',	'',	'2017-07-03',	1,	0,	0,	1);

DROP TABLE IF EXISTS `documento_categorias`;
CREATE TABLE `documento_categorias` (
  `doc_cat_doc_id` int(11) NOT NULL,
  `doc_cat_cat_id` int(11) NOT NULL,
  `doc_cat_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `empresa`;
CREATE TABLE `empresa` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_nombre` varchar(255) NOT NULL,
  `emp_descripcion` varchar(255) NOT NULL,
  `emp_ruta_amigable` varchar(50) NOT NULL,
  `emp_logo` varchar(255) NOT NULL,
  `emp_icon` varchar(255) NOT NULL,
  `emp_razon_social` varchar(255) NOT NULL,
  `emp_nit` varchar(255) NOT NULL,
  `emp_direccion` varchar(255) NOT NULL,
  `emp_coordenadas` varchar(255) NOT NULL,
  `emp_rubro` varchar(255) NOT NULL,
  `emp_telefono` varchar(255) NOT NULL,
  `emp_email` varchar(255) NOT NULL,
  `emp_web` varchar(255) NOT NULL,
  `emp_pais` varchar(50) NOT NULL,
  `emp_ciudad` varchar(50) NOT NULL,
  `emp_nombre_contacto` varchar(150) NOT NULL,
  `emp_telefono_contacto` varchar(50) NOT NULL,
  `emp_email_contacto` varchar(255) NOT NULL,
  `emp_activar` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `empresa_categorias`;
CREATE TABLE `empresa_categorias` (
  `emp_cat_emp_id` int(11) NOT NULL,
  `emp_cat_cat_id` int(11) NOT NULL,
  `emp_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`emp_cat_emp_id`,`emp_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `empresa_tipos`;
CREATE TABLE `empresa_tipos` (
  `emp_tip_emp_id` int(11) NOT NULL,
  `emp_tip_tip_id` int(11) NOT NULL,
  `emp_tip_orden` int(11) NOT NULL,
  PRIMARY KEY (`emp_tip_emp_id`,`emp_tip_tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `enlace`;
CREATE TABLE `enlace` (
  `enl_id` int(11) NOT NULL AUTO_INCREMENT,
  `enl_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `enl_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `enl_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `enl_target` varchar(15) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `enl_imagen` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `enl_clases` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `enl_activar` int(11) NOT NULL,
  `enl_papelera` int(11) NOT NULL,
  PRIMARY KEY (`enl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `enlace_categorias`;
CREATE TABLE `enlace_categorias` (
  `enl_cat_enl_id` int(11) NOT NULL,
  `enl_cat_cat_id` int(11) NOT NULL,
  `enl_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`enl_cat_enl_id`,`enl_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `enlace_grupo_usuarios`;
CREATE TABLE `enlace_grupo_usuarios` (
  `enl_grp_us_enl_id` int(11) NOT NULL,
  `enl_grp_us_grp_us_id` int(11) NOT NULL,
  `enl_grp_us_orden` int(11) NOT NULL,
  PRIMARY KEY (`enl_grp_us_enl_id`,`enl_grp_us_grp_us_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `enlace_publicaciones`;
CREATE TABLE `enlace_publicaciones` (
  `enl_pub_enl_id` int(11) NOT NULL,
  `enl_pub_pub_id` int(11) NOT NULL,
  `enl_pub_orden` int(11) NOT NULL,
  PRIMARY KEY (`enl_pub_enl_id`,`enl_pub_pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `evento`;
CREATE TABLE `evento` (
  `eve_id` int(11) NOT NULL AUTO_INCREMENT,
  `eve_nombre` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_coordenadas` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_localizacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_dia` int(1) NOT NULL,
  `eve_inicio` datetime NOT NULL,
  `eve_fin` datetime NOT NULL,
  `eve_alerta_mail` int(11) NOT NULL,
  `eve_ver` int(1) NOT NULL COMMENT '1=Libre; 2=Ocupado',
  `eve_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_notas` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_invitados` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_usuario` int(11) NOT NULL,
  `eve_papelera` int(11) NOT NULL,
  `eve_activar` int(11) NOT NULL,
  `eve_imagen` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `eve_id_dominio` int(11) NOT NULL,
  PRIMARY KEY (`eve_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `evento_calendarios`;
CREATE TABLE `evento_calendarios` (
  `eve_cal_eve_id` int(11) NOT NULL,
  `eve_cal_cal_id` int(11) NOT NULL,
  PRIMARY KEY (`eve_cal_eve_id`,`eve_cal_cal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `evento_grupos`;
CREATE TABLE `evento_grupos` (
  `eve_grp_id_eve` int(11) NOT NULL,
  `eve_grp_id_grp` int(11) NOT NULL,
  PRIMARY KEY (`eve_grp_id_eve`,`eve_grp_id_grp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `evento_roles`;
CREATE TABLE `evento_roles` (
  `eve_rol_id_eve` int(11) NOT NULL,
  `eve_rol_id_rol` int(11) NOT NULL,
  PRIMARY KEY (`eve_rol_id_eve`,`eve_rol_id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `grupo_id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grupo_detalle` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grupo_funciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `grupo_activar` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `modulo`;
CREATE TABLE `modulo` (
  `mod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_ruta_amigable` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_bd` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_bd_prefijo` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_bd_relaciones` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `mod_icono` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NOT NULL,
  `mod_color` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_tipo` int(11) NOT NULL,
  `mod_id_padre` int(11) NOT NULL,
  `mod_activar` int(11) NOT NULL COMMENT '0 - no publicado1 - publicado',
  PRIMARY KEY (`mod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `modulo` (`mod_id`, `mod_nombre`, `mod_descripcion`, `mod_ruta_amigable`, `mod_bd`, `mod_bd_prefijo`, `mod_bd_relaciones`, `mod_url`, `mod_icono`, `mod_color`, `mod_tipo`, `mod_id_padre`, `mod_activar`) VALUES
(1,	'Sistemas',	'',	'sistemas',	'sistema',	'sis_',	'sistema_modulos:sis_mod_sis_id',	'modulos/sistemas/sistemas.adm.php',	'icn-system',	'#191B1C',	2,	0,	1),
(2,	'Modulos',	'',	'modulos',	'modulo',	'mod_',	'modulo_categorias:mod_cat_mod_id,sistema_modulos:sis_mod_mod_id',	'modulos/modulos/modulos.adm.php',	'icn-box',	'#99C14C',	2,	1,	1),
(3,	'Aplicaciones',	'',	'aplicaciones',	'aplicacion',	'app_',	'',	'modulos/aplicaciones/apps.adm.php',	'icn-apps',	'#f39333',	2,	0,	1),
(4,	'Usuarios',	'',	'usuarios',	'usuario',	'usu_',	'usuario_grupos:usu_grupo_usu_id,usuario_roles:usu_rol_usu_id',	'modulos/usuarios/usuarios.adm.php',	'icn-users',	'#0076ff',	2,	0,	1),
(5,	'Estructura',	'',	'estructura',	'categoria',	'cat_',	'',	'modulos/categorias/categorias.adm.php',	'icn-category color-text-violeta-a',	'#806aad',	2,	0,	1),
(6,	'Estructura-Contenidos',	'',	'estructura-contenidos',	'contenedor',	'cont_',	'contenedor_plantilla:contenedor_cont_id',	'modulos/categorias/contenedor.adm.php',	'icn-block-page',	'#806aad',	2,	5,	1),
(7,	'Sitios',	'',	'sitios',	'sitios',	'sitios_',	'',	'modulos/sitios/sitios.adm.php',	'icn-boxs',	'#2d9ee0',	2,	0,	1),
(8,	'Contenedores',	'',	'contenedores',	'contenedor',	'cont_',	'contenedor_plantilla:contenedor_cont_id',	'modulos/config/contenedores.adm.php',	' icn-block-page',	'#0076ff',	2,	13,	1),
(9,	'Publicaciones',	'',	'publicaciones',	'publicacion',	'pub_',	'publicacion_rel:pub_rel_pub_id',	'modulos/config/publicaciones.adm.php',	'icn-rocket',	'#e71882',	2,	13,	1),
(10,	'Plantillas',	'',	'plantillas',	'plantilla',	'pla_',	'',	'modulos/config/plantilas.adm.php',	'icn-level-page',	'#8a7354',	2,	13,	1),
(11,	'Roles',	'',	'roles',	'rol',	'rol_',	'sitio_roles:sis_rol_rol_id,usuario_roles:usu_rol_rol_id,sistema_roles:sis_rol_rol_id,modulo_roles:mod_rol_rol_id,rol_categorias:rol_cat_rol_id',	'modulos/usuarios/roles.adm.php',	'icn icn-credential',	'#8b3b8f',	2,	4,	1),
(12,	'Grupos',	'',	'grupos',	'grupos',	'grupo_',	'',	'modulos/usuarios/grupos.adm.php',	'icn icn-group',	'#eb5c43',	2,	4,	1),
(13,	'Configuración General',	'',	'configuracion-sites',	'configuracion',	'config_',	'',	'modulos/config/config.adm.php',	'icn-conf color-text-rojo',	'#e71882',	2,	0,	1),
(50,	'Multimedia',	'',	'multimedia',	'multimedia',	'mul_',	'multimedia_categorias:mul_cat_mul_id',	'modulos/multimedia/multimedia.adm.php',	'icn-media color-text-rojo-b',	'#E83759',	0,	0,	1),
(51,	'Slides',	'',	'slides',	'slide',	'sli_',	'slide_categorias:sli_cat_sli_id',	'modulos/multimedia/slide.adm.php',	'icn-slide',	'#8b3b8f',	0,	0,	1),
(60,	'Notas',	'Modulo informativo, para sitios e intranet',	'notas',	'nota',	'not_',	'nota_categorias:not_cat_not_id,nota_multimedia:not_mul_not_id,nota_valores:not_val_not_id,nota_comentarios:not_com_not_id',	'modulos/notas/notas.adm.php',	'icn icn-post',	'#2d9ee0',	0,	0,	1),
(61,	'Configuración',	'',	'config-noticias',	'',	'',	'',	'modulos/noticias/noticias-config.adm.php',	'icn-conf ',	'#eb5c43',	1,	51,	1),
(70,	'Contenidos',	'',	'contenidos',	'contenido',	'conte_',	'contenido_categorias:conte_cat_conte_id,contenido_documentos:conte_doc_conte_id',	'modulos/contenidos/contenidos.adm.php',	'icn-content',	'#00bdc6',	0,	0,	1),
(80,	'Documentos',	'',	'documentos',	'documento',	'doc_',	'documento_categorias:doc_cat_doc_id',	'modulos/documentos/documentos.adm.php',	'icn-folder',	'#00bdc6',	0,	0,	1),
(90,	'Calendarios',	'',	'calendarios',	'calendario',	'cal_',	'calendario_categorias:cal_cat_cal_id, calendario_grupos:cal_grp_cal_id',	'modulos/calendarios/calendario.adm.php',	'icn-calendar',	'#e83759',	0,	0,	1),
(91,	'Eventos',	'',	'eventos',	'evento_',	'eve_',	'',	'modulos/eventos/evento.adm.php',	'icn-calendar-ok',	'#eb5c43',	0,	0,	1),
(100,	'Enlaces',	'',	'enlaces',	'enlace',	'enl_',	'enlace_categorias:enl_cat_enl_id,enlace_grupo_usuarios:enl_grup_usu_enl_id,enlace_publicaciones:enl_pub_enl_id',	'modulos/enlaces/enlaces.adm.php',	'icn-link',	'#806aad',	0,	0,	1),
(150,	'Productos',	'',	'productos',	'mod_productos',	'mod_prod_',	'mod_productos_mul:mod_prod_mul_prod_id,mod_productos_pestana:mod_pro_pes_pro_id,mod_productos_categorias:mod_prod_cat_prod_id',	'modulos/ecommerce/productos.adm.php',	'icn-box-o ',	'#c2975c',	0,	0,	1),
(151,	'Catalogo interno ',	'',	'catalogo-interno',	'',	'',	'',	'modulos/ecommerce/catalogo.adm.php',	'icn icn-catalog',	'#f39333',	0,	0,	1),
(152,	'Configuración Catálogo ',	'',	'config-catalogo',	'mod_catalogo',	'mod_catg_',	'mod_catalogo_categorias:mod_catg_cat_catg_id,mod_catalogo_roles:	mod_catg_rol_catg_id',	'modulos/ecommerce/config-catalogo.adm.php',	'icn-conf',	'#e71882',	0,	151,	1),
(153,	'Marcas',	'',	'marcas',	'mod_marcas',	'mod_mar_',	'mod_marcas_categorias:mod_mar_mar_id,mod_marcas_productos:mod_mar_mar_id',	'modulos/marcas/marcas.adm.php',	'icn-marca',	'#24aa5b',	0,	10,	1),
(154,	'Sucursales',	'',	'sucursales',	'mod_sucursales',	'mod_suc_',	'',	'modulos/productos/sucursales.adm.php',	'icn-shop',	'#e71882',	1,	0,	1),
(155,	'Configuración',	'E-commerse',	'configuracion-ec',	'',	'',	'',	'modulos/ecommerce/config-ec.adm.php',	'icn icn-conf',	'#8b3b8f',	1,	150,	1),
(200,	'Empresas',	'',	'empresas',	'empresa',	'emp_',	'empresa_categorias:emp_cat_emp_id',	'modulos/adm/empresas.adm.php',	'icn-apartament',	'#0076ff',	0,	0,	1),
(210,	'Solicitud de Permiso Fuera de oficina',	'',	'solicitud-permiso-fuera-oficina',	'',	'',	'',	'modulos/solicitud_permiso/solicitud_permiso.adm.php',	'icn-order-ok',	'#c2975c',	0,	0,	1),
(220,	'Kardex',	'',	'karex',	'mod_kardex',	'mod_krk_',	'',	'modulos/rrhh/kardex.adm.php',	'icn-kardex',	'#806aad',	0,	0,	1),
(250,	'Inventario',	'',	'',	'mod_inventario',	'mod_inv_',	'',	'modulos/rrhh/inventario.adm.php',	'icn-inventary',	'#333333',	0,	0,	1),
(255,	'Pedidos almacen',	'Cafeteria y Papeleria',	'',	'mod_pedidos',	'mod_ped_',	'',	'modulos/rrhh/pedido.adm.php',	'icn-order ',	'#00bdc6',	0,	0,	1),
(270,	'Configuración',	'Logistica',	'config-logistica',	'',	'',	'',	'modulos/logistica/config-logistica.adm.php',	'icn icn-conf',	'#33aadd',	1,	0,	1),
(271,	'Registro de transporte',	'Logistica',	'registro-transporte',	'',	'',	'',	'modulos/logistica/registro-transporte.adm.php',	'icn icn-truck-register',	'#00bdc6',	0,	0,	1),
(272,	'Zonas de distribución',	'',	'zonas-distribucion',	'',	'',	'',	'modulos/logistica/zonas-distribucion.adm.php',	'icn icn-zone',	'#f39333',	0,	0,	1),
(273,	'Pedidos e-commerce',	'E-commerce',	'pedidos-ec',	'mod_pedidos_clientes',	'mod_ped_cli_',	'mod_pedidos_productos:mod_ped_prod_ped_id',	'modulos/logistica/pedidos-ec.adm.php',	'icn icn-cart-go',	'#eb5c43',	0,	0,	1),
(300,	'Clientes',	'CRM, marketing',	'clientes',	'mod_cliente',	'mod_cli_',	'',	'modulos/crm/clientes.adm.php',	'icn icn-clients',	'#33aadd',	0,	0,	1),
(401,	'Columnistas',	'',	'columnistas',	'',	'',	'',	'modulos/editorial/columnistas.adm.php',	'icn icn-columnist',	'#806aad',	0,	0,	1),
(502,	'Proyectos',	'',	'proyectos',	'',	'',	'',	'modulos/proyectos/proyectos.adm.php',	'icn icn-project-plan',	'#2d9ee0',	0,	0,	1),
(503,	'Clientes ',	'Proyectos',	'clientes-proyectos',	'',	'',	'',	'modulos/proyectos/clientes.adm.php',	'icn icn-clients',	'#eb5c43',	0,	0,	1),
(504,	'Operaciones',	'',	'operaciones',	'',	'',	'',	'modulos/proyectos/operaciones.adm.php',	'icn icn-diagram-operation',	'#ddabce',	0,	0,	1),
(505,	'Configuración',	'proyectos',	'config-proyectos',	'',	'',	'',	'modulos/proyectos/config-proyectos.adm.php',	'icn icn-conf',	'#f39333',	0,	0,	1),
(506,	'Tareas',	'',	'tareas',	'',	'',	'',	'modulos/proyectos/tareas.adm.php',	'icn icn-checked',	'#e83759',	0,	0,	1),
(512,	'Personal',	'',	'personal',	'',	'',	'',	'modulos/proyectos/personal.adm.php',	'icn icn-user',	'#ae0000',	0,	502,	1),
(601,	'Agenda',	'',	'agenda',	'mod_agenda',	'mod_agd_',	'',	'modulos/crm/agenda.adm.php',	'icn icn-contact',	'#c2975c',	0,	0,	1),
(702,	'Administración de Campañas',	'',	'ads',	'',	'',	'',	'modulos/marketing/adm-camp.adm.php',	'icn icn-tabs-mobile',	'#0076ff',	0,	0,	1),
(703,	'Métricas',	'',	'ads-metricas',	'',	'',	'',	'modulos/marketing/metricas.adm.php',	'icn icn-clock',	'#f39333',	0,	0,	1),
(704,	'Cuenta',	'',	'ads-cuenta',	'',	'',	'',	'modulos/marketing/cuenta.adm.php',	'icn icn-folder-up',	'#33aadd',	0,	0,	1),
(705,	'Puntos & Mapas',	'',	'puntos-mapas',	'',	'',	'',	'modulos/marketing/puntos.adm.php',	'icn icn-point-map',	'#99c14c',	0,	0,	1),
(706,	'Configuración',	'Ads',	'ads-config',	'',	'',	'',	'modulos/marketing/config-ads.adm.php',	'icn icn-conf',	'#e83759',	0,	0,	1),
(801,	'Lugares',	'',	'lugares',	'',	'',	'',	'modulos/geolocalizacion/lugar.adm.php',	'icn icn-point-map',	'#e83759',	1,	0,	1);

DROP TABLE IF EXISTS `modulo_categorias`;
CREATE TABLE `modulo_categorias` (
  `mod_cat_mod_id` int(11) NOT NULL,
  `mod_cat_cat_id` int(11) NOT NULL,
  `mod_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`mod_cat_mod_id`,`mod_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `modulo_categorias` (`mod_cat_mod_id`, `mod_cat_cat_id`, `mod_cat_orden`) VALUES
(22,	32,	0),
(27,	2,	0),
(27,	3,	0),
(27,	4,	0),
(27,	85,	0),
(27,	89,	0),
(27,	97,	0),
(27,	104,	0);

DROP TABLE IF EXISTS `modulo_roles`;
CREATE TABLE `modulo_roles` (
  `mod_rol_mod_id` int(11) NOT NULL,
  `mod_rol_rol_id` int(11) NOT NULL,
  `mod_rol_permisos` varchar(20) NOT NULL DEFAULT '0,0,0,0,0',
  PRIMARY KEY (`mod_rol_mod_id`,`mod_rol_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `modulo_roles` (`mod_rol_mod_id`, `mod_rol_rol_id`, `mod_rol_permisos`) VALUES
(60,	2,	'1,1,1,0,0'),
(502,	4,	'0,0,0,0,0'),
(502,	5,	'0,0,0,0,0'),
(503,	4,	'0,0,0,0,0'),
(503,	5,	'0,0,0,0,0'),
(504,	4,	'0,0,0,0,0'),
(504,	5,	'0,0,0,0,0'),
(505,	4,	'0,0,0,0,0'),
(505,	5,	'0,0,0,0,0'),
(506,	3,	'0,0,0,0,0'),
(506,	4,	'0,0,0,0,0'),
(506,	5,	'0,0,0,0,0'),
(512,	4,	'0,0,0,0,0'),
(512,	5,	'0,0,0,0,0'),
(601,	4,	'0,0,0,0,0'),
(601,	5,	'0,0,0,0,0');

DROP TABLE IF EXISTS `mod_agenda`;
CREATE TABLE `mod_agenda` (
  `mod_agd_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_agd_nombre` varchar(200) NOT NULL,
  `mod_agd_foto` varchar(255) NOT NULL,
  `mod_agd_tags` varchar(255) NOT NULL,
  `mod_agd_empresa` varchar(200) NOT NULL,
  `mod_agd_cargo` varchar(200) NOT NULL,
  `mod_agd_email_personal` varchar(200) NOT NULL,
  `mod_agd_email_trabajo` varchar(200) NOT NULL,
  `mod_agd_telefono` varchar(100) NOT NULL,
  `mod_agd_telefono_trabajo` varchar(255) NOT NULL,
  `mod_agd_celular` varchar(100) NOT NULL,
  `mod_agd_celular_trabajo` varchar(100) NOT NULL,
  `mod_agd_fecha_nacimiento` date NOT NULL,
  `mod_agd_notas` text NOT NULL,
  `mod_agd_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_agd_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mod_agenda` (`mod_agd_id`, `mod_agd_nombre`, `mod_agd_foto`, `mod_agd_tags`, `mod_agd_empresa`, `mod_agd_cargo`, `mod_agd_email_personal`, `mod_agd_email_trabajo`, `mod_agd_telefono`, `mod_agd_telefono_trabajo`, `mod_agd_celular`, `mod_agd_celular_trabajo`, `mod_agd_fecha_nacimiento`, `mod_agd_notas`, `mod_agd_activar`) VALUES
(1,	'Magaly Justiniano',	'',	'afp,prevision,marketing',	'AFP - Previsión',	'Encargada de marketing',	'',	'mjustiniano@prevision.com.bo',	'',	'',	'',	'',	'0000-00-00',	'',	1),
(2,	'Carmen Bejarano',	'',	'',	'AFP - Previsión',	'',	'',	'cbejarano@prevision.com.bo',	'',	'591 3 363-2581',	'',	'',	'0000-00-00',	'',	1),
(3,	'Steve Nacif',	'archivos/multimedia/steve-nacif.png',	'',	'Manjar de Oro',	'Gerente Financiero',	'stevenacif@hotmail.com',	'snacif@manjardeoro.com',	'',	'',	'591 77044044',	'',	'0000-00-00',	'',	1);

DROP TABLE IF EXISTS `mod_almacen`;
CREATE TABLE `mod_almacen` (
  `alm_id` int(11) NOT NULL AUTO_INCREMENT,
  `alm_nombre` varchar(255) NOT NULL,
  `alm_descripcion` varchar(255) NOT NULL,
  `alm_cant_min` int(11) NOT NULL,
  `alm_imagen` varchar(255) NOT NULL,
  `alm_costo_unit` float NOT NULL,
  `alm_activar` int(11) NOT NULL,
  `alm_usuario` int(11) NOT NULL,
  `alm_id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`alm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_almacen_categorias`;
CREATE TABLE `mod_almacen_categorias` (
  `cat_alm_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_alm_nombre` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cat_alm_descripcion` varchar(250) CHARACTER SET latin1 NOT NULL,
  `cat_alm_activar` int(11) NOT NULL,
  `cat_alm_id_padre` int(11) NOT NULL,
  `cat_alm_usuario` int(11) NOT NULL,
  `cat_alm_orden` int(11) NOT NULL,
  PRIMARY KEY (`cat_alm_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mod_billetera`;
CREATE TABLE `mod_billetera` (
  `mod_bill_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_bill_nombre` varchar(255) NOT NULL,
  `mod_bill_descripcion` varchar(255) NOT NULL,
  `mod_bill_anu_corp` int(11) NOT NULL,
  `mod_bill_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_bill_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mod_billetera` (`mod_bill_id`, `mod_bill_nombre`, `mod_bill_descripcion`, `mod_bill_anu_corp`, `mod_bill_activar`) VALUES
(1,	'Tigo ',	'Billetera Tigo S.A',	22,	1),
(2,	'Marca Santa Cruz',	'Billetera Marca Santa Cruz.',	23,	1);

DROP TABLE IF EXISTS `mod_billetera_usuarios`;
CREATE TABLE `mod_billetera_usuarios` (
  `mod_bill_usu_usu_id` int(11) NOT NULL,
  `mod_bill_usu_bill_id` int(11) NOT NULL,
  `mod_bill_usu_inta_id` int(11) NOT NULL,
  `mod_bill_usu_valor` int(11) NOT NULL,
  `mod_bill_usu_fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`mod_bill_usu_fecha_hora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `mod_billetera_usuarios` (`mod_bill_usu_usu_id`, `mod_bill_usu_bill_id`, `mod_bill_usu_inta_id`, `mod_bill_usu_valor`, `mod_bill_usu_fecha_hora`) VALUES
(2,	2,	1,	5,	'2017-12-08 11:55:33'),
(3,	2,	1,	5,	'2017-12-08 11:56:46'),
(2,	1,	1,	5,	'2017-12-08 11:56:51'),
(3,	1,	1,	5,	'2017-12-08 11:56:59');

DROP TABLE IF EXISTS `mod_catalogo`;
CREATE TABLE `mod_catalogo` (
  `mod_catg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_catg_nombre` varchar(100) NOT NULL,
  `mod_catg_descripcion` text NOT NULL,
  `mod_catg_ruta_amigable` varchar(150) NOT NULL,
  `mod_catg_id_cat_arranque` int(11) NOT NULL,
  `mod_catg_orden` int(11) NOT NULL,
  `mod_catg_id_padre` int(11) NOT NULL DEFAULT '0',
  `mod_catg_id_empresa` int(11) NOT NULL,
  `mod_catg_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_catg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_catalogo` (`mod_catg_id`, `mod_catg_nombre`, `mod_catg_descripcion`, `mod_catg_ruta_amigable`, `mod_catg_id_cat_arranque`, `mod_catg_orden`, `mod_catg_id_padre`, `mod_catg_id_empresa`, `mod_catg_activar`) VALUES
(1,	'Catalogo Interno',	'',	'catalogo interno',	0,	1,	0,	1,	1);

DROP TABLE IF EXISTS `mod_catalogo_categorias`;
CREATE TABLE `mod_catalogo_categorias` (
  `mod_catg_cat_catg_id` int(11) NOT NULL,
  `mod_catg_cat_cat_id` int(11) NOT NULL,
  PRIMARY KEY (`mod_catg_cat_catg_id`,`mod_catg_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_catalogo_categorias` (`mod_catg_cat_catg_id`, `mod_catg_cat_cat_id`) VALUES
(1,	103);

DROP TABLE IF EXISTS `mod_catalogo_roles`;
CREATE TABLE `mod_catalogo_roles` (
  `mod_catg_rol_catg_id` int(11) NOT NULL,
  `mod_catg_rol_rol_id` int(11) NOT NULL,
  PRIMARY KEY (`mod_catg_rol_catg_id`,`mod_catg_rol_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_cats`;
CREATE TABLE `mod_cats` (
  `cts_id` int(11) NOT NULL AUTO_INCREMENT,
  `cts_nombre` varchar(50) NOT NULL,
  `cts_email` varchar(150) NOT NULL,
  `cts_encargado` varchar(150) NOT NULL,
  `cts_zona` varchar(20) NOT NULL,
  `cts_direccion` varchar(255) NOT NULL,
  `cts_telefono` varchar(20) NOT NULL,
  `cts_celular` varchar(20) NOT NULL,
  `cts_activar` int(11) NOT NULL,
  `cts_id_usuario` int(11) NOT NULL,
  `cts_id_roles` int(11) NOT NULL,
  PRIMARY KEY (`cts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_cliente`;
CREATE TABLE `mod_cliente` (
  `mod_cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_cli_nombre` varchar(150) NOT NULL,
  `mod_cli_email` varchar(150) NOT NULL,
  `mod_cli_telefono` varchar(50) NOT NULL,
  `mod_cli_nit` varchar(50) NOT NULL,
  `mod_cli_razon_social` varchar(100) NOT NULL,
  `mod_cli_id_facebook` varchar(50) NOT NULL,
  `mod_cli_foto_facebook` varchar(255) NOT NULL,
  `mod_cli_password` varchar(50) NOT NULL,
  `mod_cli_estado` int(11) NOT NULL,
  `mod_cli_id_usuario` int(11) NOT NULL,
  `mod_cli_puntos` int(11) NOT NULL DEFAULT '0',
  `mod_cli_fecha_ingreso` datetime NOT NULL,
  PRIMARY KEY (`mod_cli_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mod_cliente_estados`;
CREATE TABLE `mod_cliente_estados` (
  `mod_cli_est_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_cli_est_nombre` varchar(100) NOT NULL,
  `mod_cli_est_descripcion` tinytext NOT NULL,
  `mod_cli_est_icon` varchar(200) NOT NULL,
  `mod_cli_est_color` varchar(200) NOT NULL,
  `mod_cli_esta_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_cli_est_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mod_cliente_proyectos`;
CREATE TABLE `mod_cliente_proyectos` (
  `mod_cli_proy_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_cli_proy_nombre` varchar(100) NOT NULL,
  `mod_cli_proy_codigo` varchar(40) NOT NULL,
  `mod_cli_proy_detalle` varchar(300) NOT NULL,
  `mod_cli_proy_logo` varchar(100) NOT NULL,
  `mod_cli_proy_direccion` varchar(140) NOT NULL,
  `mod_cli_proy_coordenadas` varchar(100) NOT NULL,
  `mod_cli_proy_ciudad` varchar(100) NOT NULL,
  `mod_cli_proy_pais` varchar(100) NOT NULL,
  `mod_cli_proy_telefono` varchar(14) NOT NULL,
  `mod_cli_proy_razon_social` varchar(100) NOT NULL,
  `mod_cli_proy_nit` int(200) NOT NULL,
  `mod_cli_proy_etiqueta` int(11) NOT NULL COMMENT '1 prioridad alta, 2 prioridad media, 3 prioridad normal, 4 prioridad baja, 5 Cliente Sin actividad',
  PRIMARY KEY (`mod_cli_proy_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mod_cliente_proyectos` (`mod_cli_proy_id`, `mod_cli_proy_nombre`, `mod_cli_proy_codigo`, `mod_cli_proy_detalle`, `mod_cli_proy_logo`, `mod_cli_proy_direccion`, `mod_cli_proy_coordenadas`, `mod_cli_proy_ciudad`, `mod_cli_proy_pais`, `mod_cli_proy_telefono`, `mod_cli_proy_razon_social`, `mod_cli_proy_nit`, `mod_cli_proy_etiqueta`) VALUES
(1,	'Landicorp S.A',	'LND',	'Empresa matriz',	'',	'3er anillo. Av. La Salle ',	'23434435345, 2342388234',	'Santa Cruz de la Sierra',	'Bolivia',	'234234',	'Landicorp S.A',	23425435,	1),
(2,	'Tiendas Exito Srl.',	'TEX',	'',	'',	'',	'',	'',	'',	'',	'',	0,	5);

DROP TABLE IF EXISTS `mod_columnista`;
CREATE TABLE `mod_columnista` (
  `mod_col_usu_id` int(11) NOT NULL,
  `mod_col_orden` int(11) NOT NULL,
  PRIMARY KEY (`mod_col_usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mod_columnista` (`mod_col_usu_id`, `mod_col_orden`) VALUES
(3,	0);

DROP TABLE IF EXISTS `mod_columnista_categorias`;
CREATE TABLE `mod_columnista_categorias` (
  `mod_col_cat_cat_id` int(11) NOT NULL,
  `mod_col_cat_usu_id` int(11) NOT NULL,
  `mod_col_orden` int(11) NOT NULL,
  PRIMARY KEY (`mod_col_cat_cat_id`,`mod_col_cat_usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mod_columnista_conf`;
CREATE TABLE `mod_columnista_conf` (
  `mod_col_conf_columnista_rol_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mod_cuenta_anunciante`;
CREATE TABLE `mod_cuenta_anunciante` (
  `mod_cuenta_id` int(11) NOT NULL,
  `mod_nombre` int(11) NOT NULL,
  `mod_estado` int(11) NOT NULL,
  PRIMARY KEY (`mod_cuenta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mod_cuenta_anunciante_usuarios`;
CREATE TABLE `mod_cuenta_anunciante_usuarios` (
  `mod_cuenta_id_usuario` int(11) NOT NULL,
  `mod_cuenta_id_cuenta_anunciante` int(11) NOT NULL,
  PRIMARY KEY (`mod_cuenta_id_cuenta_anunciante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `mod_estadistica`;
CREATE TABLE `mod_estadistica` (
  `mod_est_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_est_nombre` varchar(255) NOT NULL,
  `mod_est_descripcion` tinytext NOT NULL,
  `mod_est_estado` int(11) NOT NULL,
  `mos_est_fecha_inicio` date NOT NULL,
  `mos_est_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mod_estadistica_usuarios`;
CREATE TABLE `mod_estadistica_usuarios` (
  `mod_est_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_est_usu_id` int(11) NOT NULL,
  `mod_est_est_id` int(11) NOT NULL,
  `mod_est_fecha` date NOT NULL,
  `mod_est_hora` time NOT NULL,
  `mod_est_accion` int(11) NOT NULL,
  PRIMARY KEY (`mod_est_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mod_interaccion`;
CREATE TABLE `mod_interaccion` (
  `mod_inta_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_inta_nombre` varchar(255) NOT NULL,
  `mod_inta_detalle` varchar(255) NOT NULL,
  `mod_inta_imagen` varchar(255) NOT NULL,
  `mod_inta_valor` int(11) NOT NULL,
  `mod_inta_activar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mod_inta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `mod_interaccion` (`mod_inta_id`, `mod_inta_nombre`, `mod_inta_detalle`, `mod_inta_imagen`, `mod_inta_valor`, `mod_inta_activar`) VALUES
(1,	'Click en punto',	'',	'',	5,	1),
(2,	'Llegar al punto ',	'',	'',	10,	1),
(3,	'Click en promoción de punto',	'',	'',	5,	1),
(4,	'Activar QR compra',	'',	'',	100,	1),
(5,	'Responde preguntados correctamente',	'',	'',	10,	1),
(6,	'Completo Ruta &-& ',	'',	'',	100,	1),
(7,	'Capturo un personaje',	'',	'',	10,	1);

DROP TABLE IF EXISTS `mod_interaccion_notificaciones`;
CREATE TABLE `mod_interaccion_notificaciones` (
  `mod_inta_ntf_ntf_id` int(11) NOT NULL,
  `mod_inta_ntf_inta_id` int(11) NOT NULL,
  `mod_inta_ntf_fecha` datetime NOT NULL,
  PRIMARY KEY (`mod_inta_ntf_fecha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_interaccion_usuarios`;
CREATE TABLE `mod_interaccion_usuarios` (
  `mod_inta_usu_usu_id` int(11) NOT NULL,
  `mod_inta_usu_inta_id` int(11) NOT NULL,
  `mod_inta_usu_fecha_hora` datetime NOT NULL,
  PRIMARY KEY (`mod_inta_usu_fecha_hora`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_kardex`;
CREATE TABLE `mod_kardex` (
  `mod_kdx_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_nombre` varchar(255) NOT NULL,
  `mod_kdx_apellido_paterno` varchar(255) NOT NULL,
  `mod_kdx_apellido_materno` varchar(255) NOT NULL,
  `mod_kdx_identificacion` varchar(255) NOT NULL,
  `mod_kdx_extension` varchar(255) NOT NULL,
  `mod_kdx_fecha_vencimiento_identificacion` date NOT NULL,
  `mod_kdx_fecha_vencimiento_licencia_conducir` date NOT NULL,
  `mod_kdx_fecha_nacimiento` date NOT NULL,
  `mod_kdx_nacionalidad` varchar(255) NOT NULL,
  `mod_kdx_lugar_nacimiento` varchar(255) NOT NULL,
  `mod_kdx_sexo` int(11) NOT NULL COMMENT '2 Masculino, 1 Femenino',
  `mod_kdx_estado_civil` int(11) NOT NULL,
  `mod_kdx_nombre_esp` varchar(150) NOT NULL,
  `mod_kdx_formacion_esp` varchar(150) NOT NULL,
  `mod_kdx_trabajo_esp` varchar(255) NOT NULL,
  `mod_kdx_fecha_nac_esp` date NOT NULL,
  `mod_kdx_telefono_domicilio` varchar(255) NOT NULL,
  `mod_kdx_telefono_corporativo` varchar(255) NOT NULL,
  `mod_kdx_telefono_corporativo_ext` int(11) NOT NULL,
  `mod_kdx_celular_personal` varchar(255) NOT NULL,
  `mod_kdx_celular_corporativo` varchar(255) NOT NULL,
  `mod_kdx_email_personal` varchar(255) NOT NULL,
  `mod_kdx_email_corporativo` varchar(255) NOT NULL,
  `mod_kdx_direccion_domicilio` varchar(255) NOT NULL,
  `mod_kdx_coordenadas_domicilio` varchar(255) NOT NULL,
  `mod_kdx_nro_afiliacion_cns` varchar(255) NOT NULL,
  `mod_kdx_nro_afp` varchar(255) NOT NULL,
  `mod_kdx_afp` int(11) NOT NULL,
  `mod_kdx_talla_camisa` varchar(255) NOT NULL,
  `mod_kdx_talla_pantalon` varchar(255) NOT NULL,
  `mod_kdx_talla_botines` varchar(255) NOT NULL,
  `mod_kdx_tipo_sangre` varchar(255) NOT NULL,
  `mod_kdx_empresa_actual` int(11) NOT NULL,
  `mod_kdx_division` int(11) NOT NULL,
  `mod_kdx_cargo` int(11) NOT NULL,
  `mod_kdx_departamento` int(11) NOT NULL,
  `mod_kdx_fecha_ingreso` date NOT NULL,
  `mod_kdx_fecha_retiro` date NOT NULL,
  `mod_kdx_antiguedad` int(11) NOT NULL,
  `mod_kdx_codigo_sap` int(11) NOT NULL,
  `mod_kdx_manual_funciones` int(11) NOT NULL,
  `mod_kdx_formato_contrato` int(11) NOT NULL,
  `mod_kdx_cargo_act` int(11) NOT NULL,
  `mod_kdx_cargo_ant` int(11) NOT NULL,
  `mod_kdx_abono_sueldo` varchar(50) NOT NULL,
  `mod_kdx_curriculum` varchar(255) NOT NULL,
  `mod_kdx_nivel_edu` int(11) NOT NULL,
  `mod_kdx_institucion_edu` varchar(150) NOT NULL,
  `mod_kdx_titulo` varchar(255) NOT NULL,
  `mod_kdx_fecha_titulo` varchar(150) NOT NULL,
  `mod_kdx_empresa_ant` varchar(255) NOT NULL,
  `mod_kdx_cargo_emp_ant` varchar(255) NOT NULL,
  `mod_kdx_fecha_ing_emp_ant` date NOT NULL,
  `mod_kdx_fecha_sal_emp_ant` date NOT NULL,
  `mod_kdx_antiguedad_emp_ant` int(11) NOT NULL,
  `mod_kdx_imagen` varchar(255) NOT NULL,
  `mod_kdx_id_usuario` int(11) NOT NULL,
  `mod_kdx_activar` int(11) NOT NULL,
  `mod_kdx_papelera` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mod_kardex_bancos`;
CREATE TABLE `mod_kardex_bancos` (
  `mod_kdx_bnc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_bnc_nombre` int(11) NOT NULL,
  `mod_kdx_bnc_nro_cuenta` varchar(150) NOT NULL,
  `mod_kdx_bnc_moneda` int(11) NOT NULL,
  `mod_kdx_bnc_id_kardex` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_bnc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_kardex_cargo`;
CREATE TABLE `mod_kardex_cargo` (
  `mod_kdx_car_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_car_nombre` varchar(50) NOT NULL,
  `mod_kdx_car_descripcion` varchar(255) NOT NULL,
  `mod_kdx_car_atribuciones` varchar(255) NOT NULL,
  `mod_kdx_car_responsabilidades` varchar(255) NOT NULL,
  `mod_kdx_car_dependiente` int(11) NOT NULL,
  `mod_kdx_car_ascendencia` int(11) NOT NULL,
  `mod_kdx_car_destrezas` varchar(255) NOT NULL,
  `mod_kdx_car_lugar_de_trabajo` varchar(255) NOT NULL,
  `mod_kdx_car_requisitos` varchar(255) NOT NULL,
  `mod_kdx_car_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_car_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `mod_kardex_cargo` (`mod_kdx_car_id`, `mod_kdx_car_nombre`, `mod_kdx_car_descripcion`, `mod_kdx_car_atribuciones`, `mod_kdx_car_responsabilidades`, `mod_kdx_car_dependiente`, `mod_kdx_car_ascendencia`, `mod_kdx_car_destrezas`, `mod_kdx_car_lugar_de_trabajo`, `mod_kdx_car_requisitos`, `mod_kdx_car_activar`) VALUES
(1,	'Gerente General',	'descripción',	'atr',	'res',	0,	0,	'des',	'Local',	'req',	1);

DROP TABLE IF EXISTS `mod_kardex_departamento`;
CREATE TABLE `mod_kardex_departamento` (
  `mod_kdx_dep_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_dep_nombre` varchar(255) NOT NULL,
  `mod_kdx_dep_descripcion` text NOT NULL,
  `mod_kdx_dep_id_padre` int(11) NOT NULL,
  `mod_kdx_dep_orden` int(11) NOT NULL,
  `mod_kdx_dep_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `mod_kardex_departamento` (`mod_kdx_dep_id`, `mod_kdx_dep_nombre`, `mod_kdx_dep_descripcion`, `mod_kdx_dep_id_padre`, `mod_kdx_dep_orden`, `mod_kdx_dep_activar`) VALUES
(1,	'Gerente General',	'descripción',	0,	0,	1),
(2,	'Finanzas',	'',	1,	1,	1);

DROP TABLE IF EXISTS `mod_kardex_division`;
CREATE TABLE `mod_kardex_division` (
  `mod_kdx_div_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_div_nombre` varchar(255) NOT NULL,
  `mod_kdx_div_descripcion` text NOT NULL,
  `mod_kdx_div_activar` int(1) NOT NULL,
  PRIMARY KEY (`mod_kdx_div_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `mod_kardex_division` (`mod_kdx_div_id`, `mod_kdx_div_nombre`, `mod_kdx_div_descripcion`, `mod_kdx_div_activar`) VALUES
(1,	'División Agrícola',	'descripción',	1);

DROP TABLE IF EXISTS `mod_kardex_empresa`;
CREATE TABLE `mod_kardex_empresa` (
  `mod_kdx_emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_emp_nombre` varchar(255) NOT NULL,
  `mod_kdx_emp_descripcion` varchar(255) NOT NULL,
  `mod_kdx_emp_logo` varchar(255) NOT NULL,
  `mod_kdx_emp_razon_social` varchar(255) NOT NULL,
  `mod_kdx_emp_nit` varchar(255) NOT NULL,
  `mod_kdx_emp_direccion` varchar(255) NOT NULL,
  `mod_kdx_emp_coordenadas` varchar(255) NOT NULL,
  `mod_kdx_emp_rubro` varchar(255) NOT NULL,
  `mod_kdx_emp_email` varchar(255) NOT NULL,
  `mod_kdx_emp_web` varchar(255) NOT NULL,
  `mod_kdx_emp_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `mod_kardex_empresa` (`mod_kdx_emp_id`, `mod_kdx_emp_nombre`, `mod_kdx_emp_descripcion`, `mod_kdx_emp_logo`, `mod_kdx_emp_razon_social`, `mod_kdx_emp_nit`, `mod_kdx_emp_direccion`, `mod_kdx_emp_coordenadas`, `mod_kdx_emp_rubro`, `mod_kdx_emp_email`, `mod_kdx_emp_web`, `mod_kdx_emp_activar`) VALUES
(1,	'Landicorp S.A.',	'',	'',	'Landicorp S.A.',	'',	'',	'',	'',	'',	'',	1);

DROP TABLE IF EXISTS `mod_kardex_formacion`;
CREATE TABLE `mod_kardex_formacion` (
  `mod_kdx_frm_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_frm_nombre` varchar(255) NOT NULL,
  `mod_kdx_frm_institucion` varchar(150) NOT NULL,
  `mod_kdx_frm_fecha` varchar(150) NOT NULL,
  `mod_kdx_frm_id_kardex` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_frm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_kardex_hijos`;
CREATE TABLE `mod_kardex_hijos` (
  `mod_kdx_hj_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_hj_nombre` varchar(255) NOT NULL,
  `mod_kdx_hj_inst_educativa` varchar(255) NOT NULL,
  `mod_kdx_hj_fecha_nac` date NOT NULL,
  `mod_kdx_hj_id_kardex` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_hj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_kardex_historial_corporativo`;
CREATE TABLE `mod_kardex_historial_corporativo` (
  `mod_kdx_his_corp_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_his_corp_empresa` int(11) NOT NULL,
  `mod_kdx_his_corp_fecha_ingreso` date NOT NULL,
  `mod_kdx_his_corp_fecha_salida` date NOT NULL,
  `mod_kdx_his_corp_cargo` int(11) NOT NULL,
  `mod_kdx_his_corp_id_kardex` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_his_corp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_kardex_manual_funciones`;
CREATE TABLE `mod_kardex_manual_funciones` (
  `mod_kdx_mf_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_mf_nombre` varchar(50) NOT NULL,
  `mod_kdx_mf_descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`mod_kdx_mf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_kardex_referencias`;
CREATE TABLE `mod_kardex_referencias` (
  `mod_kardex_ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kardex_ref_nombre` varchar(150) NOT NULL,
  `mod_kardex_ref_telefono` varchar(50) NOT NULL,
  `mod_kardex_ref_id_kardex` int(11) NOT NULL,
  PRIMARY KEY (`mod_kardex_ref_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_kardex_ref_emergencia`;
CREATE TABLE `mod_kardex_ref_emergencia` (
  `mod_kdx_ref_emg_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_kdx_ref_emg_nombre` varchar(255) NOT NULL,
  `mod_kdx_ref_emg_parentesco` varchar(50) NOT NULL,
  `mod_kdx_ref_emg_telefono` varchar(50) NOT NULL,
  `mod_kdx_ref_emg_id_kardex` int(11) NOT NULL,
  PRIMARY KEY (`mod_kdx_ref_emg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_lugar`;
CREATE TABLE `mod_lugar` (
  `mod_lug_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_lug_nombre` varchar(255) NOT NULL,
  `mod_lug_direccion` varchar(255) NOT NULL COMMENT 'ej: Av. 3 pasos al frente, Calle Isoso #34 Edificio Lourdes Dep. 54',
  `mod_lug_telefono` int(12) NOT NULL,
  `mod_lug_info` text NOT NULL,
  `mod_lug_imagen` varchar(255) NOT NULL,
  `mod_lug_coordenada_principal` varchar(100) NOT NULL,
  `mod_lug_coordenadas` varchar(255) NOT NULL,
  `mod_lug_estado` int(11) NOT NULL,
  `mod_lug_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_lug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `mod_lugar` (`mod_lug_id`, `mod_lug_nombre`, `mod_lug_direccion`, `mod_lug_telefono`, `mod_lug_info`, `mod_lug_imagen`, `mod_lug_coordenada_principal`, `mod_lug_coordenadas`, `mod_lug_estado`, `mod_lug_activar`) VALUES
(1,	'La Plaza principal 24 de Septiembre',	' Calle 24 de Septiembre.',	0,	'',	'archivos/multimedia/mscz-ad-1.png',	'-17.783354, -63.182146',	'-17.783832, -63.182572,-17.783760, -63.181598, -17.782762, -63.181676,-17.782843, -63.182647,-17.783832, -63.182572',	1,	1);

DROP TABLE IF EXISTS `mod_lugar_categorias`;
CREATE TABLE `mod_lugar_categorias` (
  `mod_lug_cat_lug_id` int(11) NOT NULL,
  `mod_lug_cat_cat_id` int(11) NOT NULL,
  `mod_lug_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`mod_lug_cat_lug_id`,`mod_lug_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `mod_marcas`;
CREATE TABLE `mod_marcas` (
  `mod_mar_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_mar_nombre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mod_mar_ruta_amigable` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mod_mar_logo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mod_mar_imagen` varchar(255) CHARACTER SET utf8 NOT NULL,
  `mod_mar_usuario` int(11) NOT NULL,
  `mod_mar_detalle` text CHARACTER SET utf8 NOT NULL,
  `mod_mar_id_dominio` int(11) NOT NULL,
  `mod_mar_activar` int(1) NOT NULL,
  PRIMARY KEY (`mod_mar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_marcas_categorias`;
CREATE TABLE `mod_marcas_categorias` (
  `mod_mar_cat_id` int(11) NOT NULL,
  `mod_mar_mar_id` int(11) NOT NULL,
  `mod_mar_cat_orden` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_marcas_productos`;
CREATE TABLE `mod_marcas_productos` (
  `mod_mar_prod_id` int(11) NOT NULL,
  `mod_mar_mar_id` int(11) NOT NULL,
  `mod_mar_orden` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_pedidos`;
CREATE TABLE `mod_pedidos` (
  `mod_ped_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_ped_costo` varchar(50) NOT NULL,
  `mod_ped_fecha_registro` datetime NOT NULL,
  `mod_ped_fecha_aprobacion` datetime NOT NULL,
  `mod_ped_fecha_entrega` datetime NOT NULL,
  `mod_ped_id_cats` int(11) NOT NULL,
  `mod_ped_id_usuario` int(11) NOT NULL,
  `mod_ped_estado` int(11) NOT NULL COMMENT '0-Pendiente; 1-Aprobado; 2-Cancelado; 3:Entregado',
  PRIMARY KEY (`mod_ped_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_pedidos_almacen`;
CREATE TABLE `mod_pedidos_almacen` (
  `mod_ped_alm_id_pedido` int(11) NOT NULL,
  `mod_ped_alm_id_almacen` int(11) NOT NULL,
  `mod_ped_alm_cantidad` int(11) NOT NULL,
  `mod_ped_alm_unidad` varchar(50) NOT NULL,
  `mod_ped_alm_observaciones` varchar(255) NOT NULL,
  PRIMARY KEY (`mod_ped_alm_id_pedido`,`mod_ped_alm_id_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_pedidos_cats`;
CREATE TABLE `mod_pedidos_cats` (
  `mod_ped_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_ped_costo` varchar(50) NOT NULL,
  `mod_ped_fecha_registro` datetime NOT NULL,
  `mod_ped_fecha_aprobacion` datetime NOT NULL,
  `mod_ped_fecha_entrega` datetime NOT NULL,
  `mod_ped_id_cats` int(11) NOT NULL,
  `mod_ped_id_usuario` int(11) NOT NULL,
  `mod_ped_estado` int(11) NOT NULL COMMENT '0-Pendiente; 1-Aprobado; 2-Cancelado; 3:Entregado',
  PRIMARY KEY (`mod_ped_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_pedidos_clientes`;
CREATE TABLE `mod_pedidos_clientes` (
  `mod_ped_cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_ped_cli_id_cli` int(11) NOT NULL,
  `mod_ped_cli_tipo` int(11) NOT NULL,
  `mod_ped_cli_sucursal` int(11) NOT NULL,
  `mod_ped_cli_nro` int(11) NOT NULL,
  `mod_ped_cli_fecha_registro` datetime NOT NULL,
  `mod_ped_cli_fecha_aprovacion` datetime NOT NULL,
  `mod_ped_cli_fecha_entrega` datetime NOT NULL,
  `mod_ped_cli_estado` int(11) NOT NULL,
  PRIMARY KEY (`mod_ped_cli_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_pedidos_estados`;
CREATE TABLE `mod_pedidos_estados` (
  `mod_ped_est_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_ped_est_nombre` varchar(100) NOT NULL,
  `mod_ped_est_descripcion` tinytext NOT NULL,
  `mod_ped_est_icon` varchar(50) NOT NULL,
  `mod_ped_est_color` varchar(11) NOT NULL,
  `mod_ped_accion_email` varchar(11) NOT NULL,
  `mod_ped_accion_email_plantilla` varchar(11) NOT NULL,
  `mod_ped_accion_entrega` varchar(11) NOT NULL,
  `mod_ped_accion_facturacion` varchar(11) NOT NULL,
  `mod_ped_est_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_ped_est_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mod_pedidos_productos`;
CREATE TABLE `mod_pedidos_productos` (
  `mod_ped_prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_ped_prod_ped_id` int(11) NOT NULL,
  `mod_ped_prod_prod_id` int(11) NOT NULL,
  `mod_ped_prod_precio_unidad` int(11) NOT NULL,
  `mod_ped_prod_cantidad` int(11) NOT NULL,
  `mod_ped_prod_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_ped_prod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_pedidos_sucursales`;
CREATE TABLE `mod_pedidos_sucursales` (
  `mod_ped_suc_mod_ped_id` int(11) NOT NULL,
  `mod_ped_suc_mod_suc_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_pedidos_tipo`;
CREATE TABLE `mod_pedidos_tipo` (
  `mod_ped_tipo_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_ped_tipo_nombre` varchar(100) NOT NULL,
  `mod_ped_tipo_ruta_amigable` varchar(100) NOT NULL,
  `mod_ped_tipo_descripcion` tinytext NOT NULL,
  `mod_ped_tipo_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_ped_tipo_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;


DROP TABLE IF EXISTS `mod_pedidos_zonas_distribucion`;
CREATE TABLE `mod_pedidos_zonas_distribucion` (
  `mod_ped_zod_mod_ped_id` int(11) NOT NULL,
  `mod_ped_zod_mod_zod_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;


DROP TABLE IF EXISTS `mod_pestana`;
CREATE TABLE `mod_pestana` (
  `mod_pes_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_pes_nombre` varchar(150) CHARACTER SET latin1 NOT NULL,
  `mod_pes_descripcion` varchar(255) CHARACTER SET latin1 NOT NULL,
  `mod_pes_fecha` datetime NOT NULL,
  `mod_pes_usuario` int(11) NOT NULL,
  `mod_pes_activar` int(11) NOT NULL,
  PRIMARY KEY (`mod_pes_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_pestana` (`mod_pes_id`, `mod_pes_nombre`, `mod_pes_descripcion`, `mod_pes_fecha`, `mod_pes_usuario`, `mod_pes_activar`) VALUES
(1,	'Pestaña 1',	'esto es una prueba 1',	'2016-10-25 14:40:26',	1,	1),
(2,	'Pestaña 2',	'Descripcion Pestaña 2',	'2016-10-25 14:40:36',	1,	1),
(3,	'Pestaña 3',	'asdf',	'2016-10-25 16:05:19',	1,	1);

DROP TABLE IF EXISTS `mod_plan`;
CREATE TABLE `mod_plan` (
  `mod_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_plan_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_plan_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `mod_plan_estado` int(11) NOT NULL COMMENT '0 no activo1 activo',
  `mod_plan_nivel` varchar(45) CHARACTER SET ucs2 NOT NULL,
  PRIMARY KEY (`mod_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `mod_productos`;
CREATE TABLE `mod_productos` (
  `mod_prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_prod_nombre` varchar(255) NOT NULL,
  `mod_prod_ruta_amigable` varchar(255) NOT NULL,
  `mod_prod_tags` varchar(255) NOT NULL,
  `mod_prod_codigo` varchar(255) NOT NULL,
  `mod_prod_sap` varchar(30) NOT NULL,
  `mod_prod_modelo` varchar(255) NOT NULL,
  `mod_prod_resumen` text NOT NULL,
  `mod_prod_detalles` text NOT NULL,
  `mod_prod_especificaciones` text NOT NULL,
  `mod_prod_disponibilidad` int(11) NOT NULL DEFAULT '0' COMMENT '0 disponible, 1 disponible a 15 dias, 2 disponible a 30 dias, 3 disponible a pedido,4 agotado',
  `mod_prod_imagen` varchar(255) NOT NULL DEFAULT 'images/producto_default.png',
  `mod_prod_precio` int(11) NOT NULL,
  `mod_prod_precio_detalle` varchar(255) NOT NULL,
  `mod_prod_precio_oferta` int(11) NOT NULL,
  `mod_prod_id_marca` int(11) NOT NULL,
  `mod_prod_id_doc` varchar(45) NOT NULL,
  `mod_prod_id_mul` int(11) NOT NULL,
  `mod_prod_id_dominio` int(11) NOT NULL,
  `mod_prod_json` varchar(255) NOT NULL,
  `mod_prod_activar_cat` int(11) NOT NULL DEFAULT '1',
  `mod_prod_activar` int(11) NOT NULL DEFAULT '0',
  `mod_prod_nuevo` int(11) DEFAULT '0' COMMENT '0 normal 1 nuevo(novedad)',
  PRIMARY KEY (`mod_prod_id`),
  FULLTEXT KEY `busqueda` (`mod_prod_nombre`,`mod_prod_tags`,`mod_prod_detalles`,`mod_prod_especificaciones`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `mod_productos` (`mod_prod_id`, `mod_prod_nombre`, `mod_prod_ruta_amigable`, `mod_prod_tags`, `mod_prod_codigo`, `mod_prod_sap`, `mod_prod_modelo`, `mod_prod_resumen`, `mod_prod_detalles`, `mod_prod_especificaciones`, `mod_prod_disponibilidad`, `mod_prod_imagen`, `mod_prod_precio`, `mod_prod_precio_detalle`, `mod_prod_precio_oferta`, `mod_prod_id_marca`, `mod_prod_id_doc`, `mod_prod_id_mul`, `mod_prod_id_dominio`, `mod_prod_json`, `mod_prod_activar_cat`, `mod_prod_activar`, `mod_prod_nuevo`) VALUES
(1,	'Producto 1',	'',	'prueba tax',	'',	'',	'',	'resumen corto',	'detalles',	'',	0,	'archivos/multimedia/kris-mayonesa-1.jpg',	0,	'',	0,	0,	'',	0,	0,	'',	0,	1,	0);

DROP TABLE IF EXISTS `mod_productos_categorias`;
CREATE TABLE `mod_productos_categorias` (
  `mod_prod_cat_prod_id` int(11) NOT NULL,
  `mod_prod_cat_cat_id` int(11) NOT NULL,
  `mod_prod_cat_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_productos_categorias` (`mod_prod_cat_prod_id`, `mod_prod_cat_cat_id`, `mod_prod_cat_orden`) VALUES
(1,	1,	0);

DROP TABLE IF EXISTS `mod_productos_conf`;
CREATE TABLE `mod_productos_conf` (
  `mod_prod_conf_codigo` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_sap` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_modelo` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_avanzado_img` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_detalles` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_especificaciones` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_disponibilidad` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_marca` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_precio` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_precio_detalle` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_docs` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_multimedia` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_pestana` int(1) NOT NULL DEFAULT '0',
  `mod_prod_conf_json` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_productos_conf` (`mod_prod_conf_codigo`, `mod_prod_conf_sap`, `mod_prod_conf_modelo`, `mod_prod_conf_avanzado_img`, `mod_prod_conf_detalles`, `mod_prod_conf_especificaciones`, `mod_prod_conf_disponibilidad`, `mod_prod_conf_marca`, `mod_prod_conf_precio`, `mod_prod_conf_precio_detalle`, `mod_prod_conf_docs`, `mod_prod_conf_multimedia`, `mod_prod_conf_pestana`, `mod_prod_conf_json`) VALUES
(0,	0,	0,	1,	1,	1,	0,	0,	1,	0,	1,	1,	0,	0);

DROP TABLE IF EXISTS `mod_productos_docs`;
CREATE TABLE `mod_productos_docs` (
  `mod_prod_doc_doc_id` int(11) NOT NULL,
  `mod_prod_doc_prod_id` int(11) NOT NULL,
  `mod_prod_doc_orden` int(11) NOT NULL,
  PRIMARY KEY (`mod_prod_doc_doc_id`,`mod_prod_doc_prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_productos_docs` (`mod_prod_doc_doc_id`, `mod_prod_doc_prod_id`, `mod_prod_doc_orden`) VALUES
(7,	1,	0),
(8,	1,	2),
(9,	1,	1);

DROP TABLE IF EXISTS `mod_productos_mul`;
CREATE TABLE `mod_productos_mul` (
  `mod_prod_mul_mul_id` int(11) NOT NULL,
  `mod_prod_mul_prod_id` int(11) NOT NULL,
  `mod_prod_mul_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `mod_productos_mul` (`mod_prod_mul_mul_id`, `mod_prod_mul_prod_id`, `mod_prod_mul_orden`) VALUES
(11,	1,	0);

DROP TABLE IF EXISTS `mod_productos_pestana`;
CREATE TABLE `mod_productos_pestana` (
  `mod_pro_pes_pro_id` int(11) NOT NULL,
  `mod_pro_pes_pes_id` int(11) NOT NULL,
  `mod_pro_pes_contenido` text NOT NULL,
  `mod_pro_pes_orden` int(11) NOT NULL,
  PRIMARY KEY (`mod_pro_pes_pro_id`,`mod_pro_pes_pes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `mod_productos_pestana` (`mod_pro_pes_pro_id`, `mod_pro_pes_pes_id`, `mod_pro_pes_contenido`, `mod_pro_pes_orden`) VALUES
(311,	2,	'<p>sdfgsdg</p>',	1);

DROP TABLE IF EXISTS `mod_stock`;
CREATE TABLE `mod_stock` (
  `mod_stk_prod` int(11) NOT NULL,
  `mod_stk_suc` int(11) NOT NULL,
  `mod_stk_cantidad` int(11) NOT NULL,
  `mod_stk_fecha` datetime NOT NULL,
  `mod_stk_fecha_ingreso` date NOT NULL,
  PRIMARY KEY (`mod_stk_prod`,`mod_stk_suc`,`mod_stk_fecha`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;

INSERT INTO `mod_stock` (`mod_stk_prod`, `mod_stk_suc`, `mod_stk_cantidad`, `mod_stk_fecha`, `mod_stk_fecha_ingreso`) VALUES
(3175,	1,	65,	'2016-12-14 00:00:00',	'2016-12-14'),
(3184,	4,	15,	'2016-12-20 12:01:48',	'2016-12-20'),
(3178,	4,	107,	'2016-12-20 12:02:15',	'2016-12-20');

DROP TABLE IF EXISTS `mod_sucursales`;
CREATE TABLE `mod_sucursales` (
  `mod_suc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mod_suc_nombre` varchar(50) NOT NULL,
  `mod_suc_direccion` varchar(150) NOT NULL,
  `mod_suc_telefono` varchar(100) NOT NULL,
  `mod_suc_coordenadas` varchar(50) NOT NULL,
  `mod_suc_activar` int(11) NOT NULL,
  `mod_suc_correo` varchar(150) NOT NULL,
  PRIMARY KEY (`mod_suc_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO `mod_sucursales` (`mod_suc_id`, `mod_suc_nombre`, `mod_suc_direccion`, `mod_suc_telefono`, `mod_suc_coordenadas`, `mod_suc_activar`, `mod_suc_correo`) VALUES
(1,	'Sucursal Las Palmas',	'Av. Grigota #885 entre 3er y 4to anillo',	'591 - 3 - 354-4149',	'-17.809727,-63.206155',	1,	'laspalmas@panaderiavictoria.com'),
(2,	'Sucursal Alemana',	'Av. Alemana entre 3er y 4to anillo',	'591 - 3 - 33419677',	'-17.755105,-63.165109',	1,	'alemana@panaderiavictoria.com'),
(3,	'Sucursal Buenos Aires',	'Calle Buenos Aires No. 285',	'591 - 3 - 332-3409 / 591 - 3- 333-4897',	'-17.780973,-63.18546922',	1,	'ventascentral@panaderiavictoria.com'),
(4,	'Sucursal Brasil',	'Av. Brasil y Calle 1',	'591 - 3 - 348-7070',	'-17.785580,-63.15628',	1,	'brasil@panaderiavictoria.com'),
(5,	'Sucursal Prueba',	'Av. Brasil Tercer anillo',	'333333',	'',	1,	'angel11982@gmail.com');

DROP TABLE IF EXISTS `multimedia`;
CREATE TABLE `multimedia` (
  `mul_id` int(11) NOT NULL AUTO_INCREMENT,
  `mul_nombre` varchar(255) NOT NULL,
  `mul_tags` varchar(500) NOT NULL,
  `mul_url_archivo` varchar(255) NOT NULL,
  `mul_ruta_amigable` varchar(255) NOT NULL,
  `mul_url` varchar(255) NOT NULL,
  `mul_destino` varchar(10) NOT NULL DEFAULT '_self',
  `mul_embed` text NOT NULL,
  `mul_tipo_archivo` varchar(255) NOT NULL,
  `mul_leyenda` varchar(255) NOT NULL,
  `mul_texto_alternativo` varchar(255) NOT NULL,
  `mul_descripcion` text NOT NULL,
  `mul_dimension` varchar(255) NOT NULL,
  `mul_tamano` varchar(255) NOT NULL,
  `mul_fecha` datetime NOT NULL,
  `mul_usuario` int(11) NOT NULL,
  `mul_id_dominio` int(11) NOT NULL DEFAULT '0',
  `mul_activar` int(11) NOT NULL,
  PRIMARY KEY (`mul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `multimedia` (`mul_id`, `mul_nombre`, `mul_tags`, `mul_url_archivo`, `mul_ruta_amigable`, `mul_url`, `mul_destino`, `mul_embed`, `mul_tipo_archivo`, `mul_leyenda`, `mul_texto_alternativo`, `mul_descripcion`, `mul_dimension`, `mul_tamano`, `mul_fecha`, `mul_usuario`, `mul_id_dominio`, `mul_activar`) VALUES
(2,	'manosde',	'',	'archivos/multimedia/manosde.jpg',	'manosde.jpg',	'',	'_self',	'',	'jpeg',	'',	'',	'',	'480 x 287',	'99454',	'2017-06-16 13:31:44',	1,	0,	1),
(3,	'prubea',	'',	'',	'prubea',	'',	'_self',	'<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LHkMo9pZkq0\" frameborder=\"0\" allowfullscreen></iframe>',	'embed',	'',	'',	'',	'',	'',	'2017-06-16 14:30:57',	1,	0,	1),
(4,	'bg-1',	'',	'archivos/multimedia/bg-1.jpg',	'',	'',	'',	'',	'jpeg',	'Organiza y haz crecer tu <strong>negocio</strong>',	'',	'Next  es la forma más sencilla de controlar tu negocio pyme, aplicaciones simples, eficientes y poderosas,  supera tus necesidades y lleva al éxito a tu empresa.',	'1500 x 513',	'168 KB',	'2017-06-17 14:14:42',	1,	0,	1),
(11,	'foto-hermany',	'',	'archivos/multimedia/foto-hermany.png',	'foto-hermany.png',	'',	'_self',	'',	'png',	'',	'',	'',	'542 x 498',	'447993',	'2017-06-15 15:20:16',	1,	0,	1),
(12,	'victoria-5',	'',	'archivos/multimedia/victoria-5.mp4',	'victoria-5.mp4',	'',	'_self',	'',	'mp4',	'',	'',	'',	' x ',	'200x200',	'2017-06-18 01:49:09',	1,	0,	1),
(13,	'kris-mayonesa-1',	'',	'archivos/multimedia/kris-mayonesa-1.jpg',	'kris-mayonesa-1.jpg',	'',	'_self',	'',	'jpeg',	'',	'',	'',	'680 x 680',	'78256',	'2017-06-23 15:18:42',	1,	0,	1),
(14,	'kris-salsa-golf-1',	'',	'archivos/multimedia/kris-salsa-golf-1.jpg',	'kris-salsa-golf-1.jpg',	'',	'_self',	'',	'jpeg',	'',	'',	'',	'680 x 680',	'77685',	'2017-06-23 15:18:42',	1,	0,	1),
(15,	'02-milord',	'',	'archivos/multimedia/02-milord.mp3',	'02-milord.mp3',	'',	'_self',	'',	'mp3',	'',	'',	'',	' x ',	'6536071',	'2017-07-01 16:50:40',	1,	0,	1),
(16,	'afp-revision-logo',	'',	'archivos/multimedia/afp-revision-logo.png',	'afp-revision-logo.png',	'',	'_self',	'',	'png',	'',	'',	'',	'420 x 218',	'34915',	'2017-08-04 18:18:24',	1,	0,	1),
(17,	'steve-nacif',	'',	'archivos/multimedia/steve-nacif.png',	'steve-nacif.png',	'',	'_self',	'',	'png',	'',	'',	'',	'534 x 507',	'328777',	'2017-08-04 23:09:07',	1,	0,	1),
(18,	'descarga-1',	'',	'archivos/multimedia/descarga-1.jpg',	'descarga-1.jpg',	'',	'_self',	'',	'jpeg',	'',	'',	'',	'263 x 192',	'6017',	'2018-02-17 10:10:31',	4,	0,	1),
(19,	'descarga-1',	'',	'archivos/multimedia/descarga-1.jpg',	'descarga-1.jpg',	'',	'_self',	'',	'jpeg',	'',	'',	'',	'263 x 192',	'6017',	'2018-02-17 11:13:00',	4,	0,	1);

DROP TABLE IF EXISTS `multimedia_categorias`;
CREATE TABLE `multimedia_categorias` (
  `mul_cat_mul_id` int(11) NOT NULL,
  `mul_cat_cat_id` int(11) NOT NULL,
  `mul_cat_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `multimedia_categorias` (`mul_cat_mul_id`, `mul_cat_cat_id`, `mul_cat_orden`) VALUES
(6,	89,	1),
(8,	97,	1),
(7,	90,	1),
(9,	1,	5),
(3,	83,	2),
(22,	76,	1),
(4,	1,	6);

DROP TABLE IF EXISTS `multimedia_conf`;
CREATE TABLE `multimedia_conf` (
  `mul_conf_cropp` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `multimedia_conf` (`mul_conf_cropp`) VALUES
('300x320:Estandar,250x170:prueba');

DROP TABLE IF EXISTS `nota`;
CREATE TABLE `nota` (
  `not_id` int(11) NOT NULL AUTO_INCREMENT,
  `not_titulo` varchar(255) NOT NULL,
  `not_ruta_amigable` varchar(255) NOT NULL,
  `not_tags` varchar(255) NOT NULL,
  `not_resumen` varchar(255) NOT NULL,
  `not_cuerpo` text NOT NULL,
  `not_imagen` varchar(255) NOT NULL,
  `not_fecha` datetime NOT NULL,
  `not_comentarios` int(11) NOT NULL DEFAULT '0' COMMENT '0 - no comentarios 1 - con comentarios',
  `not_id_video` int(11) NOT NULL,
  `not_autor` varchar(100) NOT NULL,
  `not_lugar` varchar(45) NOT NULL,
  `not_usuario` int(11) NOT NULL,
  `not_activar` int(11) NOT NULL,
  PRIMARY KEY (`not_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `nota` (`not_id`, `not_titulo`, `not_ruta_amigable`, `not_tags`, `not_resumen`, `not_cuerpo`, `not_imagen`, `not_fecha`, `not_comentarios`, `not_id_video`, `not_autor`, `not_lugar`, `not_usuario`, `not_activar`) VALUES
(1,	'FUNDARE participó  de la Feria del Medio  Ambiente',	'hola-mundo',	'',	'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',	'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptat<span style=\"background-color: rgb(255, 255, 0);\">e velit esse c</span>illum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Donec elementum ligula eu sapien consequat eleifend. Donec nec dolor erat, condimentum sagittis</p><p><br></p><p><br></p><p><br></p>',	'',	'2017-12-24 17:09:00',	0,	0,	'0',	'',	1,	1),
(2,	'Reciclaje, práctica  incipiente en Bolivia',	'toyo-lider-en-baterias-en-bolivia',	'',	'Lorem Ipsum Dolor Sit Amet Consectetur Adipisicing Elit Sed\n',	'<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. </p><p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Donec elementum ligula eu sapien consequat eleifend. Donec nec dolor<br></p>',	'archivos/noticias/cainco-santa-cruz-comenzo-a-reciclar-celulares-y-computadoras_636.jpg',	'2017-11-24 09:42:00',	0,	0,	'0',	'',	1,	1);

DROP TABLE IF EXISTS `nota_categorias`;
CREATE TABLE `nota_categorias` (
  `not_cat_not_id` int(11) NOT NULL,
  `not_cat_cat_id` int(11) NOT NULL,
  `not_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`not_cat_not_id`,`not_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `nota_categorias` (`not_cat_not_id`, `not_cat_cat_id`, `not_cat_orden`) VALUES
(2,	4,	2);

DROP TABLE IF EXISTS `nota_comentarios`;
CREATE TABLE `nota_comentarios` (
  `not_com_id` int(11) NOT NULL AUTO_INCREMENT,
  `not_com_not_id` int(11) NOT NULL,
  `not_com_com_id` int(11) NOT NULL,
  `not_com_padre_id` int(11) NOT NULL,
  `not_com_orden` int(11) NOT NULL,
  PRIMARY KEY (`not_com_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `nota_comentarios` (`not_com_id`, `not_com_not_id`, `not_com_com_id`, `not_com_padre_id`, `not_com_orden`) VALUES
(1,	2,	1,	0,	1),
(2,	2,	2,	0,	2);

DROP TABLE IF EXISTS `nota_multimedia`;
CREATE TABLE `nota_multimedia` (
  `not_mul_not_id` int(11) NOT NULL,
  `not_mul_mul_id` int(11) NOT NULL,
  `not_mul_orden` int(11) NOT NULL,
  PRIMARY KEY (`not_mul_not_id`,`not_mul_mul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `nota_productos`;
CREATE TABLE `nota_productos` (
  `not_prod_prod_id` int(11) NOT NULL,
  `not_prod_not_id` int(11) NOT NULL,
  `not_prod_orden` int(11) NOT NULL,
  PRIMARY KEY (`not_prod_prod_id`,`not_prod_not_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `nota_valores`;
CREATE TABLE `nota_valores` (
  `not_val_not_id` int(11) NOT NULL,
  `not_val_val_id` int(11) NOT NULL,
  `not_val_orden` int(11) NOT NULL,
  PRIMARY KEY (`not_val_not_id`,`not_val_val_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `ntf_id` int(11) NOT NULL AUTO_INCREMENT,
  `ntf_nombre` varchar(255) NOT NULL,
  `ntf_descripcion` varchar(255) NOT NULL,
  `ntf_contexto` tinytext NOT NULL,
  `ntf_ruta_archivo` varchar(255) NOT NULL,
  `ntf_html` text NOT NULL,
  `ntf_activar` int(11) NOT NULL,
  PRIMARY KEY (`ntf_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `plantilla`;
CREATE TABLE `plantilla` (
  `pla_id` int(11) NOT NULL AUTO_INCREMENT,
  `pla_nombre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pla_ruta_amigable` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pla_icono` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pla_imagen` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pla_meta` text CHARACTER SET utf8 NOT NULL,
  `pla_css` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pla_clase` varchar(45) CHARACTER SET utf8 NOT NULL,
  `pla_codigos` text CHARACTER SET utf8 NOT NULL,
  `pla_tipo` int(11) NOT NULL DEFAULT '0',
  `pla_movil` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pla_onload` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `pla_activar` int(11) NOT NULL,
  PRIMARY KEY (`pla_id`),
  KEY `pla_id` (`pla_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

INSERT INTO `plantilla` (`pla_id`, `pla_nombre`, `pla_ruta_amigable`, `pla_icono`, `pla_imagen`, `pla_meta`, `pla_css`, `pla_clase`, `pla_codigos`, `pla_tipo`, `pla_movil`, `pla_onload`, `pla_activar`) VALUES
(1,	'plantilla_1',	'p=1',	'sitios/landicorp/images/favicon.icon',	'',	'',	'',	'',	'',	0,	'',	'page_precarga();',	1),
(2,	'plantilla_2',	'p=2',	'',	'',	'',	'',	'',	'',	0,	'',	'',	1),
(3,	'plantilla_3',	'p=3',	'',	'',	'',	'',	'',	'',	0,	'',	'',	1);

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_texto` text NOT NULL,
  `post_url` varchar(255) NOT NULL,
  `post_fecha` datetime NOT NULL,
  `post_tipo` int(11) NOT NULL,
  `post_permiso` int(11) NOT NULL DEFAULT '0',
  `post_estado` int(11) NOT NULL DEFAULT '0',
  `post_activar` int(11) NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `printer`;
CREATE TABLE `printer` (
  `prit_id` int(11) NOT NULL AUTO_INCREMENT,
  `prit_accion` varchar(50) NOT NULL,
  `prit_id_aux` int(11) NOT NULL,
  `prit_id_suc` int(11) NOT NULL,
  `prit_fecha` datetime NOT NULL,
  `prit_estado` int(11) NOT NULL,
  `prit_txt` varchar(5) NOT NULL DEFAULT 'SEÑOR',
  PRIMARY KEY (`prit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO `printer` (`prit_id`, `prit_accion`, `prit_id_aux`, `prit_id_suc`, `prit_fecha`, `prit_estado`, `prit_txt`) VALUES
(1,	'pedido',	1,	2,	'2016-12-15 12:42:06',	1,	'SEÑOR'),
(2,	'pedido',	50,	4,	'2017-02-10 10:14:17',	1,	'SEÑOR');

DROP TABLE IF EXISTS `publicacion`;
CREATE TABLE `publicacion` (
  `pub_id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_nombre` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_descripcion` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_imagen` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_titulo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_tipo` int(11) NOT NULL DEFAULT '0',
  `pub_archivo` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_archivo_config` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `pub_css` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_clase` varchar(255) CHARACTER SET utf8 NOT NULL,
  `pub_id_item` int(11) NOT NULL DEFAULT '0',
  `pub_numero` int(11) NOT NULL DEFAULT '0',
  `pub_id_cat` int(11) NOT NULL DEFAULT '0',
  `pub_activar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

INSERT INTO `publicacion` (`pub_id`, `pub_nombre`, `pub_descripcion`, `pub_imagen`, `pub_titulo`, `pub_tipo`, `pub_archivo`, `pub_archivo_config`, `pub_css`, `pub_clase`, `pub_id_item`, `pub_numero`, `pub_id_cat`, `pub_activar`) VALUES
(1,	'nav',	'',	'',	'',	1,	'modulos/nav.pub.php',	'',	'',	'',	0,	0,	0,	1),
(2,	'slide',	'',	'',	'',	1,	'modulos/slide.pub.php',	'',	'',	'',	0,	0,	0,	1),
(3,	'signup',	'',	'',	'',	1,	'modulos/signup.pub.php',	'',	'',	'',	0,	0,	0,	1),
(4,	'redireccion',	'',	'',	'',	1,	'modulos/redireccion.pub.php',	'',	'',	'',	0,	0,	0,	1);

DROP TABLE IF EXISTS `publicacion_rel`;
CREATE TABLE `publicacion_rel` (
  `pubrel_id` int(11) NOT NULL AUTO_INCREMENT,
  `pubrel_cat_id` int(11) NOT NULL,
  `pubrel_pla_id` int(11) NOT NULL,
  `pubrel_cont_id` int(11) NOT NULL,
  `pubrel_pub_id` int(11) NOT NULL,
  `pubrel_activar` int(11) NOT NULL DEFAULT '0',
  `pubrel_orden` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pubrel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `publicacion_rel` (`pubrel_id`, `pubrel_cat_id`, `pubrel_pla_id`, `pubrel_cont_id`, `pubrel_pub_id`, `pubrel_activar`, `pubrel_orden`) VALUES
(2,	81,	1,	1,	3,	1,	1),
(3,	82,	1,	1,	3,	1,	1),
(4,	83,	1,	1,	3,	1,	1),
(5,	81,	3,	1,	7,	1,	1),
(6,	82,	3,	1,	7,	1,	1),
(7,	83,	3,	1,	7,	1,	1),
(8,	79,	1,	1,	5,	1,	1),
(9,	76,	1,	1,	8,	1,	0),
(10,	78,	1,	1,	4,	1,	0),
(11,	80,	1,	1,	6,	1,	0),
(14,	1,	2,	1,	9,	1,	0),
(15,	89,	1,	1,	3,	1,	0),
(16,	90,	1,	1,	3,	1,	0),
(17,	97,	1,	1,	12,	1,	0),
(18,	97,	3,	1,	13,	1,	0),
(19,	101,	1,	1,	14,	1,	0),
(20,	101,	3,	1,	15,	1,	0),
(23,	9,	1,	3,	1,	1,	0),
(24,	9,	1,	4,	3,	1,	0),
(25,	1,	1,	1,	4,	1,	0);

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `rol_id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(45) NOT NULL,
  `rol_descripcion` varchar(255) NOT NULL,
  `rol_funciones` varchar(255) NOT NULL,
  `rol_redireccion` int(11) NOT NULL DEFAULT '1',
  `rol_id_padre` int(11) NOT NULL,
  `rol_grupo` int(11) NOT NULL,
  `rol_permisos` varchar(45) NOT NULL,
  `rol_activar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `rol` (`rol_id`, `rol_nombre`, `rol_descripcion`, `rol_funciones`, `rol_redireccion`, `rol_id_padre`, `rol_grupo`, `rol_permisos`, `rol_activar`) VALUES
(1,	'Administrador',	'',	'todo poderoso',	2,	0,	1,	'',	1),
(2,	'Diseñador web',	'',	'',	1,	1,	1,	'',	1),
(3,	'Personal',	'',	'',	2,	0,	0,	'',	1),
(4,	'Gerente de Proyecto',	'',	'',	2,	0,	0,	'',	1),
(5,	'Coodinador',	'',	'',	2,	0,	0,	'',	1);

DROP TABLE IF EXISTS `rol_categorias`;
CREATE TABLE `rol_categorias` (
  `rol_cat_cat_id` int(11) NOT NULL,
  `rol_cat_rol_id` int(11) NOT NULL,
  `rol_cat_orden` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `rol_categorias` (`rol_cat_cat_id`, `rol_cat_rol_id`, `rol_cat_orden`) VALUES
(1,	2,	0);

DROP TABLE IF EXISTS `sistema`;
CREATE TABLE `sistema` (
  `sis_id` int(11) NOT NULL AUTO_INCREMENT,
  `sis_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sis_descripcion` text CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sis_icono` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sis_color` varchar(7) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sis_tipo` int(11) NOT NULL COMMENT '0 - Multiproposito1 - CMS2 - CRM3 - ERP4 - RRHH5 - ADM7 - PROYECTOS8 - FiNANZAS9 - GERENCIA10 - TIC',
  `sis_activar` int(11) NOT NULL,
  `sis_orden` int(11) NOT NULL,
  PRIMARY KEY (`sis_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `sistema` (`sis_id`, `sis_nombre`, `sis_descripcion`, `sis_icono`, `sis_color`, `sis_tipo`, `sis_activar`, `sis_orden`) VALUES
(1,	'Websites',	'',	'icn-code',	'#ffda43',	1,	1,	1),
(2,	'E-commerce',	'',	'icn-cart',	'#e83759',	10,	0,	8),
(3,	'Intranet',	'',	'icn-intranet',	'#879099',	0,	1,	3),
(4,	'Recursos Humanos',	'',	'icn-rrhh color-text-violeta',	'#8b3b8f',	4,	0,	12),
(5,	'Gerencia',	'',	'icn-suitcase color-text-naranja',	'#8a7354',	0,	0,	11),
(6,	'Proyectos',	'',	'icn icn-proyect',	'#0076ff',	0,	1,	0),
(7,	'Finazas',	'',	'icn icn-finance',	'#00bdc6',	6,	0,	4),
(8,	'Logistica',	'',	'icn icn-logistics',	'#99c14c',	10,	0,	5),
(9,	'CRM',	'',	'icn icn-crm',	'#e71882',	2,	0,	7),
(10,	'Editorial',	'',	'icn icn-newspaper',	'#3f444b',	0,	0,	10),
(11,	'Ads',	'',	'icn icn-megaphone',	'#806aad',	0,	0,	9),
(12,	'Geo',	'',	'icn icn-zone',	'#dcdc07',	0,	0,	6);

DROP TABLE IF EXISTS `sistema_modulos`;
CREATE TABLE `sistema_modulos` (
  `sis_mod_sis_id` int(11) NOT NULL,
  `sis_mod_mod_id` int(11) NOT NULL,
  `sis_mod_orden` int(11) NOT NULL,
  PRIMARY KEY (`sis_mod_sis_id`,`sis_mod_mod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `sistema_modulos` (`sis_mod_sis_id`, `sis_mod_mod_id`, `sis_mod_orden`) VALUES
(1,	100,	2),
(1,	80,	3),
(1,	70,	4),
(1,	60,	1),
(1,	51,	5),
(1,	50,	6),
(2,	150,	1),
(2,	151,	2),
(2,	152,	9),
(2,	153,	3),
(2,	154,	4),
(2,	155,	10),
(2,	271,	5),
(2,	272,	6),
(2,	273,	7),
(2,	300,	8),
(5,	200,	0),
(4,	220,	0),
(10,	60,	0),
(10,	401,	0),
(6,	506,	0),
(6,	505,	0),
(6,	504,	0),
(6,	512,	0),
(6,	503,	0),
(6,	601,	0),
(11,	702,	0),
(11,	703,	0),
(11,	704,	0),
(11,	705,	0),
(11,	706,	0),
(12,	801,	0),
(6,	502,	0);

DROP TABLE IF EXISTS `sistema_roles`;
CREATE TABLE `sistema_roles` (
  `sis_rol_sis_id` int(11) NOT NULL,
  `sis_rol_rol_id` int(11) NOT NULL,
  PRIMARY KEY (`sis_rol_sis_id`,`sis_rol_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sistema_roles` (`sis_rol_sis_id`, `sis_rol_rol_id`) VALUES
(1,	2),
(6,	3),
(6,	4),
(6,	5);

DROP TABLE IF EXISTS `sitio`;
CREATE TABLE `sitio` (
  `sitio_id` int(11) NOT NULL AUTO_INCREMENT,
  `sitio_nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sitio_descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sitio_ruta_amigable` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sitio_icono` varchar(25) NOT NULL,
  `sitio_url` varchar(255) NOT NULL,
  `sitio_target` varchar(10) NOT NULL DEFAULT '_blank',
  `sitio_tipo` int(11) NOT NULL DEFAULT '0' COMMENT '0. normal 1.Logeado 2.Site',
  `sitio_carpeta` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sitio_orden` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `sitio_activar` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sitio_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `sitio` (`sitio_id`, `sitio_nombre`, `sitio_descripcion`, `sitio_ruta_amigable`, `sitio_icono`, `sitio_url`, `sitio_target`, `sitio_tipo`, `sitio_carpeta`, `sitio_orden`, `sitio_activar`) VALUES
(1,	'Sitio Raiz',	'',	'',	'',	'',	'_blank',	2,	'',	'1',	1),
(2,	'Dashboard',	'',	'dashboard',	'',	'',	'',	1,	'',	'2',	1);

DROP TABLE IF EXISTS `sitio_categorias`;
CREATE TABLE `sitio_categorias` (
  `sitio_cat_sitio_id` int(11) NOT NULL,
  `sitio_cat_cat_id` int(11) NOT NULL,
  `sitio_cat_orden` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `sitio_roles`;
CREATE TABLE `sitio_roles` (
  `sitio_rol_sitio_id` int(11) NOT NULL,
  `sitio_rol_rol_id` int(11) NOT NULL,
  `sitio_rol_orden` int(11) NOT NULL,
  PRIMARY KEY (`sitio_rol_sitio_id`,`sitio_rol_rol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `sitio_roles` (`sitio_rol_sitio_id`, `sitio_rol_rol_id`, `sitio_rol_orden`) VALUES
(2,	1,	0),
(2,	2,	0),
(2,	3,	0),
(2,	4,	0),
(2,	5,	0);

DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `sli_id` int(11) NOT NULL AUTO_INCREMENT,
  `sli_nombre` varchar(255) NOT NULL,
  `sli_activar` int(11) NOT NULL,
  PRIMARY KEY (`sli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `slide_categorias`;
CREATE TABLE `slide_categorias` (
  `sli_cat_sli_id` int(11) NOT NULL,
  `sli_cat_cat_id` int(11) NOT NULL,
  `sli_cat_orden` int(11) NOT NULL,
  PRIMARY KEY (`sli_cat_sli_id`,`sli_cat_cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `slide_multimedia`;
CREATE TABLE `slide_multimedia` (
  `sli_mul_id` int(11) NOT NULL,
  `sli_mul_sli_id` int(11) NOT NULL,
  `sli_mul_mul_id` int(11) NOT NULL,
  `sli_mul_titulo` varchar(255) NOT NULL,
  `sli_mul_resumen` varchar(255) NOT NULL,
  `sli_mul_url` varchar(255) NOT NULL,
  `sli_mul_destino` varchar(40) NOT NULL,
  `sli_mul_orden` int(11) NOT NULL,
  `sli_mul_activar` int(11) NOT NULL,
  PRIMARY KEY (`sli_mul_id`,`sli_mul_mul_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `solicitud_permiso`;
CREATE TABLE `solicitud_permiso` (
  `sol_per_id` int(11) NOT NULL AUTO_INCREMENT,
  `sol_per_id_usuario` int(11) NOT NULL,
  `sol_per_id_dependencia` int(11) NOT NULL,
  `sol_per_fecha` date NOT NULL,
  `sol_per_fecha_inicio` datetime NOT NULL,
  `sol_per_fecha_final` datetime NOT NULL,
  `sol_per_motivo` text NOT NULL,
  `sol_per_compensar` int(1) NOT NULL COMMENT '0=si;1=no',
  `sol_per_fecha_autorizado` datetime NOT NULL,
  `sol_per_nota` text NOT NULL,
  `sol_per_estado` int(1) NOT NULL COMMENT '0=solicitado;1=Revision;2=Aprobado;3=denegado',
  `sol_per_activar` int(1) NOT NULL,
  `sol_per_papelera` int(1) NOT NULL,
  PRIMARY KEY (`sol_per_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `tipo_empresas`;
CREATE TABLE `tipo_empresas` (
  `tip_emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_emp_nombre` varchar(150) NOT NULL,
  `tip_emp_descripcion` varchar(255) NOT NULL,
  `tip_emp_activar` int(11) NOT NULL,
  `tip_emp_usuario` int(11) NOT NULL,
  PRIMARY KEY (`tip_emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tipo_empresas` (`tip_emp_id`, `tip_emp_nombre`, `tip_emp_descripcion`, `tip_emp_activar`, `tip_emp_usuario`) VALUES
(1,	'Corporaci?n',	'',	1,	1),
(2,	'Proveedores',	'',	1,	1);

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `usu_id` bigint(50) NOT NULL AUTO_INCREMENT,
  `usu_nombre` varchar(255) NOT NULL,
  `usu_apellidos` varchar(255) NOT NULL,
  `usu_email` varchar(255) NOT NULL,
  `usu_password` varchar(45) DEFAULT NULL,
  `usu_estado` int(11) NOT NULL,
  `usu_nivel` int(11) NOT NULL DEFAULT '1',
  `usu_imagen` varchar(255) NOT NULL,
  `usu_padre` int(11) NOT NULL,
  `usu_ruta_amigable` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `usu_amigos` text NOT NULL,
  `usu_activar` int(11) NOT NULL,
  PRIMARY KEY (`usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `usuario` (`usu_id`, `usu_nombre`, `usu_apellidos`, `usu_email`, `usu_password`, `usu_estado`, `usu_nivel`, `usu_imagen`, `usu_padre`, `usu_ruta_amigable`, `usu_amigos`, `usu_activar`) VALUES
(1,	'Hermany',	'Terrazas',	'hterrazas@wappcom.com',	'NDg2Mg==',	1,	0,	'archivos/multimedia/foto-hermany.png',	0,	'',	'',	1),
(2,	'Design',	'wapp',	'hterrazas@wappcom.com',	'NDg2Mg==',	1,	0,	'',	1,	'',	'',	1),
(3,	'Franklin',	'Zorrillo Flores',	'franklin.zorrillo@ns.com.bo',	'ZnJhbmtsaW56',	1,	1,	'',	1,	'',	'',	1),
(4,	'Gerson',	'Osinaga Ordoñez',	'gerson.osinaga@ns.com.bo',	'MTIzNA==',	1,	1,	'',	1,	'',	'',	1),
(5,	'Jorge',	'Hurtado Albarez',	'jorge.hurtado@ns.com.bo',	'MTIzNA==',	1,	1,	'',	1,	'',	'',	1);

DROP TABLE IF EXISTS `usuario_grupos`;
CREATE TABLE `usuario_grupos` (
  `usu_grupo_usu_id` int(11) NOT NULL,
  `usu_grupo_grupo_id` int(11) NOT NULL,
  `usu_grupo_orden` int(11) NOT NULL,
  PRIMARY KEY (`usu_grupo_usu_id`,`usu_grupo_grupo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `usuario_redes_sociales`;
CREATE TABLE `usuario_redes_sociales` (
  `usu_rs_usu_id` bigint(50) NOT NULL,
  `usu_rs_fb_id` bigint(50) NOT NULL,
  `usu_rs_gl_id` bigint(50) NOT NULL,
  `usu_rs_ins_id` bigint(50) NOT NULL,
  PRIMARY KEY (`usu_rs_usu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

INSERT INTO `usuario_redes_sociales` (`usu_rs_usu_id`, `usu_rs_fb_id`, `usu_rs_gl_id`, `usu_rs_ins_id`) VALUES
(2,	2147483647,	0,	0);

DROP TABLE IF EXISTS `usuario_roles`;
CREATE TABLE `usuario_roles` (
  `usu_rol_usu_id` int(11) NOT NULL,
  `usu_rol_rol_id` int(11) NOT NULL,
  `usu_rol_orden` int(11) NOT NULL,
  PRIMARY KEY (`usu_rol_usu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci ROW_FORMAT=COMPACT;

INSERT INTO `usuario_roles` (`usu_rol_usu_id`, `usu_rol_rol_id`, `usu_rol_orden`) VALUES
(1,	1,	0),
(2,	2,	0),
(3,	1,	0),
(4,	4,	0),
(5,	3,	0);

DROP TABLE IF EXISTS `usuario_seguidos`;
CREATE TABLE `usuario_seguidos` (
  `usu_sgd_id` int(11) NOT NULL AUTO_INCREMENT,
  `usu_sgd_seguido_usu_id` int(11) NOT NULL,
  `usu_sgd_seguidor_usu_id` int(11) NOT NULL,
  `usu_sgd_red_social` int(11) NOT NULL COMMENT '1.facebook 2.google 3.instagram',
  `usu_sgd_tipo` int(11) NOT NULL COMMENT '1. Amigo 2. Anunciante',
  `usu_sgd_fecha` datetime NOT NULL,
  PRIMARY KEY (`usu_sgd_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `valor`;
CREATE TABLE `valor` (
  `val_id` int(11) NOT NULL AUTO_INCREMENT,
  `val_tipo` int(11) NOT NULL COMMENT '1. Like  2. De 0 a 5 3. V o F  4. De 1 a 10  5. De 1 a 100',
  `val_valor` int(11) NOT NULL,
  `val_usario` int(11) NOT NULL,
  `val_fecha` datetime NOT NULL,
  PRIMARY KEY (`val_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;


DROP TABLE IF EXISTS `valor_notas`;
CREATE TABLE `valor_notas` (
  `val_not_id` int(11) NOT NULL,
  `val_usuario` int(11) NOT NULL,
  `val_tipo` int(11) NOT NULL COMMENT '1. Like  2. De 0 a 5 3. V o F  4. De 1 a 10  5. De 1 a 100',
  `val_valor` int(11) NOT NULL,
  `val_fecha` datetime NOT NULL,
  PRIMARY KEY (`val_usuario`,`val_not_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;


-- 2018-02-17 19:35:45
