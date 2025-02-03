import 'package:flutter/material.dart';
import '../../../components/svg/erply_svg.dart';

/// Represents the data for an Erply icon
class ErplyIconData {
  final String name;
  const ErplyIconData(this.name);
  bool get isValid => ErplyIcons.availableIcons.contains(name);
  String get path => 'packages/erply_ui/assets/icons/$name.svg';
}

/// A widget for rendering Erply icons with extensive customization
class ErplyIcon extends StatelessWidget {
  final ErplyIconData? icon;
  final double? size;
  final double? fill;
  final double? weight;
  final double? grade;
  final double? opticalSize;
  final Color? color;
  final List<Shadow>? shadows;
  final String? semanticsLabel;
  final TextDirection? textDirection;
  final bool? applyTextScaling;
  final BlendMode? blendMode;
  final bool animated;

  const ErplyIcon(
    this.icon, {
    super.key,
    this.size,
    this.fill,
    this.weight,
    this.grade,
    this.opticalSize,
    this.color,
    this.shadows,
    this.semanticsLabel,
    this.textDirection,
    this.applyTextScaling,
    this.blendMode,
    this.animated = false,
  });

  @override
  Widget build(BuildContext context) {
    if (icon == null) return const SizedBox.shrink();

    if (!icon!.isValid) {
      return Text(
        '❓',
        style: TextStyle(
          color: color ?? Theme.of(context).iconTheme.color,
          fontSize: size ?? Theme.of(context).iconTheme.size,
        ),
        semanticsLabel: semanticsLabel ?? 'Invalid icon',
      );
    }

    return animated
        ? ErplySvg.animated(
            icon!.path,
            width: size,
            height: size,
            color: color,
            fit: BoxFit.contain,
          )
        : ErplySvg.asset(
            icon!.path,
            width: size,
            height: size,
            color: color,
            fit: BoxFit.contain,
            semanticsLabel: semanticsLabel,
          );
  }
}

/// Manages Erply custom SVG icons
class ErplyIcons {
  ErplyIcons._();

  /// List of all available icons
  static final List<String> availableIcons = [
    'columns',
    'underline',
    'grid',
    'triangle',
    'search',
    'volume-2',
    'arrow-up-circle',
    'pause-circle',
    'check-square',
    'arrow-down',
    'figma',
    'corner-right-up',
    'chevrons-right',
    'list',
    'chevrons-down',
    'wind',
    'corner-up-right',
    'target',
    'scissors',
    'minimize-2',
    'play-circle',
    'crosshair',
    'airplay',
    'x-octagon',
    'repeat',
    'edit-3',
    'volume-1',
    'sunrise',
    'toggle-right',
    'umbrella',
    'user',
    'file-minus',
    'x-circle',
    'circle',
    'phone-missed',
    'edit-2',
    'corner-left-up',
    'home',
    'gitlab',
    'music',
    'smartphone',
    'more-horizontal',
    'sliders',
    'arrow-up-left',
    'chevron-down',
    'hexagon',
    'github',
    'crop',
    'tag',
    'briefcase',
    'rotate-cw',
    'map',
    'inbox',
    'align-justify',
    'plus-square',
    'power',
    'database',
    'camera-off',
    'toggle-left',
    'file',
    'message-circle',
    'voicemail',
    'terminal',
    'move',
    'maximize',
    'chevron-up',
    'arrow-down-left',
    'file-text',
    'droplet',
    'zap-off',
    'x',
    'bar-chart',
    'lock',
    'log-in',
    'shopping-bag',
    'divide',
    'cloud-drizzle',
    'refresh-cw',
    'chevron-right',
    'clipboard',
    'package',
    'instagram',
    'link',
    'video-off',
    'key',
    'meh',
    'corner-down-right',
    'arrow-right',
    'aperture',
    'stop-circle',
    'log-out',
    'arrow-left-circle',
    'bar-chart-2',
    'git-pull-request',
    'minimize',
    'minus-square',
    'settings',
    'cloud-snow',
    'thumbs-down',
    'type',
    'archive',
    'phone-outgoing',
    'pocket',
    'mail',
    'shield',
    'download',
    'phone-forwarded',
    'corner-right-down',
    'book-open',
    'divide-square',
    'server',
    'tv',
    'skip-forward',
    'volume',
    'user-plus',
    'battery-charging',
    'layers',
    'slash',
    'radio',
    'book',
    'user-minus',
    'bell',
    'git-branch',
    'coffee',
    'code',
    'thermometer',
    'cast',
    'flag',
    'eye-off',
    'battery',
    'disc',
    'frown',
    'tool',
    'cpu',
    'bold',
    'hash',
    'share-2',
    'plus',
    'check',
    'rotate-ccw',
    'hard-drive',
    'bluetooth',
    'pie-chart',
    'headphones',
    'rss',
    'wifi',
    'corner-up-left',
    'watch',
    'info',
    'user-x',
    'loader',
    'refresh-ccw',
    'folder-plus',
    'git-merge',
    'mic',
    'copy',
    'zoom-in',
    'arrow-right-circle',
    'align-right',
    'image',
    'maximize-2',
    'check-circle',
    'sunset',
    'save',
    'smile',
    'navigation',
    'cloud-lightning',
    'paperclip',
    'fast-forward',
    'x-square',
    'award',
    'zoom-out',
    'box',
    'thumbs-up',
    'percent',
    'sidebar',
    'square',
    'play',
    'git-commit',
    'table',
    'send',
    'phone-call',
    'speaker',
    'facebook',
    'codesandbox',
    'camera',
    'link-2',
    'printer',
    'folder-minus',
    'arrow-up-right',
    'truck',
    'life-buoy',
    'pen-tool',
    'at-sign',
    'feather',
    'trash',
    'wifi-off',
    'corner-left-down',
    'dollar-sign',
    'star',
    'cloud-off',
    'sun',
    'message-square',
    'edit',
    'anchor',
    'alert-circle',
    'chevrons-up',
    'upload-cloud',
    'twitch',
    'youtube',
    'unlock',
    'compass',
    'plus-circle',
    'credit-card',
    'cloud-rain',
    'trash-2',
    'skip-back',
    'file-plus',
    'delete',
    'command',
    'clock',
    'octagon',
    'phone',
    'eye',
    'phone-off',
    'codepen',
    'dribbble',
    'gift',
    'external-link',
    'zap',
    'trello',
    'more-vertical',
    'mic-off',
    'share',
    'arrow-up',
    'bell-off',
    'linkedin',
    'video',
    'divide-circle',
    'activity',
    'twitter',
    'map-pin',
    'filter',
    'phone-incoming',
    'italic',
    'chevrons-left',
    'calendar',
    'globe',
    'arrow-left',
    'align-center',
    'minus-circle',
    'arrow-down-right',
    'framer',
    'volume-x',
    'slack',
    'cloud',
    'download-cloud',
    'shuffle',
    'rewind',
    'upload',
    'trending-down',
    'pause',
    'arrow-down-circle',
    'bookmark',
    'alert-triangle',
    'user-check',
    'tablet',
    'alert-octagon',
    'menu',
    'chrome',
    'shopping-cart',
    'folder',
    'users',
    'corner-down-left',
    'monitor',
    'minus',
    'help-circle',
    'navigation-2',
    'chevron-left',
    'film',
    'moon',
    'shield-off',
    'layout',
    'mouse-pointer',
    'align-left',
    'heart',
    'trending-up'
  ];

  /// Check if an icon exists
  static bool hasIcon(String iconName) => availableIcons.contains(iconName);

  /// Dynamically generate an icon by name
  static ErplyIconData icon(String name) {
    if (!hasIcon(name)) {
      throw ArgumentError('Icon "$name" not found in Erply Icons');
    }
    return ErplyIconData(name);
  }

  // Static icon data getters for frequently used icons
  static ErplyIconData get columns => const ErplyIconData('columns');
  static ErplyIconData get underline => const ErplyIconData('underline');
  static ErplyIconData get grid => const ErplyIconData('grid');
  static ErplyIconData get triangle => const ErplyIconData('triangle');
  static ErplyIconData get search => const ErplyIconData('search');
  static ErplyIconData get volume2 => const ErplyIconData('volume-2');
  static ErplyIconData get arrowUpCircle =>
      const ErplyIconData('arrow-up-circle');
  static ErplyIconData get pauseCircle => const ErplyIconData('pause-circle');
  static ErplyIconData get checkSquare => const ErplyIconData('check-square');
  static ErplyIconData get arrowDown => const ErplyIconData('arrow-down');
  static ErplyIconData get figma => const ErplyIconData('figma');
  static ErplyIconData get cornerRightUp =>
      const ErplyIconData('corner-right-up');
  static ErplyIconData get chevronsRight =>
      const ErplyIconData('chevrons-right');
  static ErplyIconData get list => const ErplyIconData('list');
  static ErplyIconData get chevronsDown => const ErplyIconData('chevrons-down');
  static ErplyIconData get wind => const ErplyIconData('wind');
  static ErplyIconData get cornerUpRight =>
      const ErplyIconData('corner-up-right');
  static ErplyIconData get target => const ErplyIconData('target');
  static ErplyIconData get scissors => const ErplyIconData('scissors');
  static ErplyIconData get minimize2 => const ErplyIconData('minimize-2');
  static ErplyIconData get playCircle => const ErplyIconData('play-circle');
  static ErplyIconData get crosshair => const ErplyIconData('crosshair');
  static ErplyIconData get airplay => const ErplyIconData('airplay');
  static ErplyIconData get xOctagon => const ErplyIconData('x-octagon');
  static ErplyIconData get repeat => const ErplyIconData('repeat');
  static ErplyIconData get edit3 => const ErplyIconData('edit-3');
  static ErplyIconData get volume1 => const ErplyIconData('volume-1');
  static ErplyIconData get sunrise => const ErplyIconData('sunrise');
  static ErplyIconData get toggleRight => const ErplyIconData('toggle-right');
  static ErplyIconData get umbrella => const ErplyIconData('umbrella');
  static ErplyIconData get user => const ErplyIconData('user');
  static ErplyIconData get fileMinus => const ErplyIconData('file-minus');
  static ErplyIconData get xCircle => const ErplyIconData('x-circle');
  static ErplyIconData get circle => const ErplyIconData('circle');
  static ErplyIconData get phoneMissed => const ErplyIconData('phone-missed');
  static ErplyIconData get edit2 => const ErplyIconData('edit-2');
  static ErplyIconData get cornerLeftUp =>
      const ErplyIconData('corner-left-up');
  static ErplyIconData get home => const ErplyIconData('home');
  static ErplyIconData get gitlab => const ErplyIconData('gitlab');
  static ErplyIconData get music => const ErplyIconData('music');
  static ErplyIconData get smartphone => const ErplyIconData('smartphone');
  static ErplyIconData get moreHorizontal =>
      const ErplyIconData('more-horizontal');
  static ErplyIconData get sliders => const ErplyIconData('sliders');
  static ErplyIconData get arrowUpLeft => const ErplyIconData('arrow-up-left');
  static ErplyIconData get chevronDown => const ErplyIconData('chevron-down');
  static ErplyIconData get hexagon => const ErplyIconData('hexagon');
  static ErplyIconData get github => const ErplyIconData('github');
  static ErplyIconData get crop => const ErplyIconData('crop');
  static ErplyIconData get tag => const ErplyIconData('tag');
  static ErplyIconData get briefcase => const ErplyIconData('briefcase');
  static ErplyIconData get rotateCw => const ErplyIconData('rotate-cw');
  static ErplyIconData get map => const ErplyIconData('map');
  static ErplyIconData get inbox => const ErplyIconData('inbox');
  static ErplyIconData get alignJustify => const ErplyIconData('align-justify');
  static ErplyIconData get plusSquare => const ErplyIconData('plus-square');
  static ErplyIconData get power => const ErplyIconData('power');
  static ErplyIconData get database => const ErplyIconData('database');
  static ErplyIconData get cameraOff => const ErplyIconData('camera-off');
  static ErplyIconData get toggleLeft => const ErplyIconData('toggle-left');
  static ErplyIconData get file => const ErplyIconData('file');
  static ErplyIconData get messageCircle =>
      const ErplyIconData('message-circle');
  static ErplyIconData get voicemail => const ErplyIconData('voicemail');
  static ErplyIconData get terminal => const ErplyIconData('terminal');
  static ErplyIconData get move => const ErplyIconData('move');
  static ErplyIconData get maximize => const ErplyIconData('maximize');
  static ErplyIconData get chevronUp => const ErplyIconData('chevron-up');
  static ErplyIconData get arrowDownLeft =>
      const ErplyIconData('arrow-down-left');
  static ErplyIconData get fileText => const ErplyIconData('file-text');
  static ErplyIconData get droplet => const ErplyIconData('droplet');
  static ErplyIconData get zapOff => const ErplyIconData('zap-off');
  static ErplyIconData get x => const ErplyIconData('x');
  static ErplyIconData get barChart => const ErplyIconData('bar-chart');
  static ErplyIconData get lock => const ErplyIconData('lock');
  static ErplyIconData get logIn => const ErplyIconData('log-in');
  static ErplyIconData get shoppingBag => const ErplyIconData('shopping-bag');
  static ErplyIconData get divide => const ErplyIconData('divide');
  static ErplyIconData get cloudDrizzle => const ErplyIconData('cloud-drizzle');
  static ErplyIconData get refreshCw => const ErplyIconData('refresh-cw');
  static ErplyIconData get chevronRight => const ErplyIconData('chevron-right');
  static ErplyIconData get clipboard => const ErplyIconData('clipboard');
  static ErplyIconData get package => const ErplyIconData('package');
  static ErplyIconData get instagram => const ErplyIconData('instagram');
  static ErplyIconData get link => const ErplyIconData('link');
  static ErplyIconData get videoOff => const ErplyIconData('video-off');
  static ErplyIconData get key => const ErplyIconData('key');
  static ErplyIconData get meh => const ErplyIconData('meh');
  static ErplyIconData get cornerDownRight =>
      const ErplyIconData('corner-down-right');
  static ErplyIconData get arrowRight => const ErplyIconData('arrow-right');
  static ErplyIconData get aperture => const ErplyIconData('aperture');
  static ErplyIconData get stopCircle => const ErplyIconData('stop-circle');
  static ErplyIconData get logOut => const ErplyIconData('log-out');
  static ErplyIconData get arrowLeftCircle =>
      const ErplyIconData('arrow-left-circle');
  static ErplyIconData get barChart2 => const ErplyIconData('bar-chart-2');
  static ErplyIconData get gitPullRequest =>
      const ErplyIconData('git-pull-request');
  static ErplyIconData get minimize => const ErplyIconData('minimize');
  static ErplyIconData get minusSquare => const ErplyIconData('minus-square');
  static ErplyIconData get settings => const ErplyIconData('settings');
  static ErplyIconData get cloudSnow => const ErplyIconData('cloud-snow');
  static ErplyIconData get thumbsDown => const ErplyIconData('thumbs-down');
  static ErplyIconData get type => const ErplyIconData('type');
  static ErplyIconData get archive => const ErplyIconData('archive');
  static ErplyIconData get phoneOutgoing =>
      const ErplyIconData('phone-outgoing');
  static ErplyIconData get pocket => const ErplyIconData('pocket');
  static ErplyIconData get mail => const ErplyIconData('mail');
  static ErplyIconData get shield => const ErplyIconData('shield');
  static ErplyIconData get download => const ErplyIconData('download');
  static ErplyIconData get phoneForwarded =>
      const ErplyIconData('phone-forwarded');
  static ErplyIconData get cornerRightDown =>
      const ErplyIconData('corner-right-down');
  static ErplyIconData get bookOpen => const ErplyIconData('book-open');
  static ErplyIconData get divideSquare => const ErplyIconData('divide-square');
  static ErplyIconData get server => const ErplyIconData('server');
  static ErplyIconData get tv => const ErplyIconData('tv');
  static ErplyIconData get skipForward => const ErplyIconData('skip-forward');
  static ErplyIconData get volume => const ErplyIconData('volume');
  static ErplyIconData get userPlus => const ErplyIconData('user-plus');
  static ErplyIconData get batteryCharging =>
      const ErplyIconData('battery-charging');
  static ErplyIconData get layers => const ErplyIconData('layers');
  static ErplyIconData get slash => const ErplyIconData('slash');
  static ErplyIconData get radio => const ErplyIconData('radio');
  static ErplyIconData get book => const ErplyIconData('book');
  static ErplyIconData get userMinus => const ErplyIconData('user-minus');
  static ErplyIconData get bell => const ErplyIconData('bell');
  static ErplyIconData get gitBranch => const ErplyIconData('git-branch');
  static ErplyIconData get coffee => const ErplyIconData('coffee');
  static ErplyIconData get code => const ErplyIconData('code');
  static ErplyIconData get thermometer => const ErplyIconData('thermometer');
  static ErplyIconData get cast => const ErplyIconData('cast');
  static ErplyIconData get flag => const ErplyIconData('flag');
  static ErplyIconData get eyeOff => const ErplyIconData('eye-off');
  static ErplyIconData get battery => const ErplyIconData('battery');
  static ErplyIconData get disc => const ErplyIconData('disc');
  static ErplyIconData get frown => const ErplyIconData('frown');
  static ErplyIconData get tool => const ErplyIconData('tool');
  static ErplyIconData get cpu => const ErplyIconData('cpu');
  static ErplyIconData get bold => const ErplyIconData('bold');
  static ErplyIconData get hash => const ErplyIconData('hash');
  static ErplyIconData get share2 => const ErplyIconData('share-2');
  static ErplyIconData get plus => const ErplyIconData('plus');
  static ErplyIconData get check => const ErplyIconData('check');
  static ErplyIconData get rotateCcw => const ErplyIconData('rotate-ccw');
  static ErplyIconData get hardDrive => const ErplyIconData('hard-drive');
  static ErplyIconData get bluetooth => const ErplyIconData('bluetooth');
  static ErplyIconData get pieChart => const ErplyIconData('pie-chart');
  static ErplyIconData get headphones => const ErplyIconData('headphones');
  static ErplyIconData get rss => const ErplyIconData('rss');
  static ErplyIconData get wifi => const ErplyIconData('wifi');
  static ErplyIconData get cornerUpLeft =>
      const ErplyIconData('corner-up-left');
  static ErplyIconData get watch => const ErplyIconData('watch');
  static ErplyIconData get info => const ErplyIconData('info');
  static ErplyIconData get userX => const ErplyIconData('user-x');
  static ErplyIconData get loader => const ErplyIconData('loader');
  static ErplyIconData get refreshCcw => const ErplyIconData('refresh-ccw');
  static ErplyIconData get folderPlus => const ErplyIconData('folder-plus');
  static ErplyIconData get gitMerge => const ErplyIconData('git-merge');
  static ErplyIconData get mic => const ErplyIconData('mic');
  static ErplyIconData get copy => const ErplyIconData('copy');
  static ErplyIconData get zoomIn => const ErplyIconData('zoom-in');
  static ErplyIconData get arrowRightCircle =>
      const ErplyIconData('arrow-right-circle');
  static ErplyIconData get alignRight => const ErplyIconData('align-right');
  static ErplyIconData get image => const ErplyIconData('image');
  static ErplyIconData get maximize2 => const ErplyIconData('maximize-2');
  static ErplyIconData get checkCircle => const ErplyIconData('check-circle');
  static ErplyIconData get sunset => const ErplyIconData('sunset');
  static ErplyIconData get save => const ErplyIconData('save');
  static ErplyIconData get smile => const ErplyIconData('smile');
  static ErplyIconData get navigation => const ErplyIconData('navigation');
  static ErplyIconData get cloudLightning =>
      const ErplyIconData('cloud-lightning');
  static ErplyIconData get paperclip => const ErplyIconData('paperclip');
  static ErplyIconData get fastForward => const ErplyIconData('fast-forward');
  static ErplyIconData get xSquare => const ErplyIconData('x-square');
  static ErplyIconData get award => const ErplyIconData('award');
  static ErplyIconData get zoomOut => const ErplyIconData('zoom-out');
  static ErplyIconData get box => const ErplyIconData('box');
  static ErplyIconData get thumbsUp => const ErplyIconData('thumbs-up');
  static ErplyIconData get percent => const ErplyIconData('percent');
  static ErplyIconData get sidebar => const ErplyIconData('sidebar');
  static ErplyIconData get square => const ErplyIconData('square');
  static ErplyIconData get play => const ErplyIconData('play');
  static ErplyIconData get gitCommit => const ErplyIconData('git-commit');
  static ErplyIconData get table => const ErplyIconData('table');
  static ErplyIconData get send => const ErplyIconData('send');
  static ErplyIconData get phoneCall => const ErplyIconData('phone-call');
  static ErplyIconData get speaker => const ErplyIconData('speaker');
  static ErplyIconData get facebook => const ErplyIconData('facebook');
  static ErplyIconData get codesandbox => const ErplyIconData('codesandbox');
  static ErplyIconData get camera => const ErplyIconData('camera');
  static ErplyIconData get link2 => const ErplyIconData('link-2');
  static ErplyIconData get printer => const ErplyIconData('printer');
  static ErplyIconData get folderMinus => const ErplyIconData('folder-minus');
  static ErplyIconData get arrowUpRight =>
      const ErplyIconData('arrow-up-right');
  static ErplyIconData get truck => const ErplyIconData('truck');
  static ErplyIconData get lifeBuoy => const ErplyIconData('life-buoy');
  static ErplyIconData get penTool => const ErplyIconData('pen-tool');
  static ErplyIconData get atSign => const ErplyIconData('at-sign');
  static ErplyIconData get feather => const ErplyIconData('feather');
  static ErplyIconData get trash => const ErplyIconData('trash');
  static ErplyIconData get wifiOff => const ErplyIconData('wifi-off');
  static ErplyIconData get cornerLeftDown =>
      const ErplyIconData('corner-left-down');
  static ErplyIconData get dollarSign => const ErplyIconData('dollar-sign');
  static ErplyIconData get star => const ErplyIconData('star');
  static ErplyIconData get cloudOff => const ErplyIconData('cloud-off');
  static ErplyIconData get sun => const ErplyIconData('sun');
  static ErplyIconData get messageSquare =>
      const ErplyIconData('message-square');
  static ErplyIconData get edit => const ErplyIconData('edit');
  static ErplyIconData get anchor => const ErplyIconData('anchor');
  static ErplyIconData get alertCircle => const ErplyIconData('alert-circle');
  static ErplyIconData get chevronsUp => const ErplyIconData('chevrons-up');
  static ErplyIconData get uploadCloud => const ErplyIconData('upload-cloud');
  static ErplyIconData get twitch => const ErplyIconData('twitch');
  static ErplyIconData get youtube => const ErplyIconData('youtube');
  static ErplyIconData get unlock => const ErplyIconData('unlock');
  static ErplyIconData get compass => const ErplyIconData('compass');
  static ErplyIconData get plusCircle => const ErplyIconData('plus-circle');
  static ErplyIconData get creditCard => const ErplyIconData('credit-card');
  static ErplyIconData get cloudRain => const ErplyIconData('cloud-rain');
  static ErplyIconData get trash2 => const ErplyIconData('trash-2');
  static ErplyIconData get skipBack => const ErplyIconData('skip-back');
  static ErplyIconData get filePlus => const ErplyIconData('file-plus');
  static ErplyIconData get delete => const ErplyIconData('delete');
  static ErplyIconData get command => const ErplyIconData('command');
  static ErplyIconData get clock => const ErplyIconData('clock');
  static ErplyIconData get octagon => const ErplyIconData('octagon');
  static ErplyIconData get phone => const ErplyIconData('phone');
  static ErplyIconData get eye => const ErplyIconData('eye');
  static ErplyIconData get phoneOff => const ErplyIconData('phone-off');
  static ErplyIconData get codepen => const ErplyIconData('codepen');
  static ErplyIconData get dribbble => const ErplyIconData('dribbble');
  static ErplyIconData get gift => const ErplyIconData('gift');
  static ErplyIconData get externalLink => const ErplyIconData('external-link');
  static ErplyIconData get zap => const ErplyIconData('zap');
  static ErplyIconData get trello => const ErplyIconData('trello');
  static ErplyIconData get moreVertical => const ErplyIconData('more-vertical');
  static ErplyIconData get micOff => const ErplyIconData('mic-off');
  static ErplyIconData get share => const ErplyIconData('share');
  static ErplyIconData get arrowUp => const ErplyIconData('arrow-up');
  static ErplyIconData get bellOff => const ErplyIconData('bell-off');
  static ErplyIconData get linkedin => const ErplyIconData('linkedin');
  static ErplyIconData get video => const ErplyIconData('video');
  static ErplyIconData get divideCircle => const ErplyIconData('divide-circle');
  static ErplyIconData get activity => const ErplyIconData('activity');
  static ErplyIconData get twitter => const ErplyIconData('twitter');
  static ErplyIconData get mapPin => const ErplyIconData('map-pin');
  static ErplyIconData get filter => const ErplyIconData('filter');
  static ErplyIconData get phoneIncoming =>
      const ErplyIconData('phone-incoming');
  static ErplyIconData get italic => const ErplyIconData('italic');
  static ErplyIconData get chevronsLeft => const ErplyIconData('chevrons-left');
  static ErplyIconData get calendar => const ErplyIconData('calendar');
  static ErplyIconData get globe => const ErplyIconData('globe');
  static ErplyIconData get arrowLeft => const ErplyIconData('arrow-left');
  static ErplyIconData get alignCenter => const ErplyIconData('align-center');
  static ErplyIconData get minusCircle => const ErplyIconData('minus-circle');
  static ErplyIconData get arrowDownRight =>
      const ErplyIconData('arrow-down-right');
  static ErplyIconData get framer => const ErplyIconData('framer');
  static ErplyIconData get volumeX => const ErplyIconData('volume-x');
  static ErplyIconData get slack => const ErplyIconData('slack');
  static ErplyIconData get cloud => const ErplyIconData('cloud');
  static ErplyIconData get downloadCloud =>
      const ErplyIconData('download-cloud');
  static ErplyIconData get shuffle => const ErplyIconData('shuffle');
  static ErplyIconData get rewind => const ErplyIconData('rewind');
  static ErplyIconData get upload => const ErplyIconData('upload');
  static ErplyIconData get trendingDown => const ErplyIconData('trending-down');
  static ErplyIconData get pause => const ErplyIconData('pause');
  static ErplyIconData get arrowDownCircle =>
      const ErplyIconData('arrow-down-circle');
  static ErplyIconData get bookmark => const ErplyIconData('bookmark');
  static ErplyIconData get alertTriangle =>
      const ErplyIconData('alert-triangle');
  static ErplyIconData get userCheck => const ErplyIconData('user-check');
  static ErplyIconData get tablet => const ErplyIconData('tablet');
  static ErplyIconData get alertOctagon => const ErplyIconData('alert-octagon');
  static ErplyIconData get menu => const ErplyIconData('menu');
  static ErplyIconData get chrome => const ErplyIconData('chrome');
  static ErplyIconData get shoppingCart => const ErplyIconData('shopping-cart');
  static ErplyIconData get folder => const ErplyIconData('folder');
  static ErplyIconData get users => const ErplyIconData('users');
  static ErplyIconData get cornerDownLeft =>
      const ErplyIconData('corner-down-left');
  static ErplyIconData get monitor => const ErplyIconData('monitor');
  static ErplyIconData get minus => const ErplyIconData('minus');
  static ErplyIconData get helpCircle => const ErplyIconData('help-circle');
  static ErplyIconData get navigation2 => const ErplyIconData('navigation-2');
  static ErplyIconData get chevronLeft => const ErplyIconData('chevron-left');
  static ErplyIconData get film => const ErplyIconData('film');
  static ErplyIconData get moon => const ErplyIconData('moon');
  static ErplyIconData get shieldOff => const ErplyIconData('shield-off');
  static ErplyIconData get layout => const ErplyIconData('layout');
  static ErplyIconData get mousePointer => const ErplyIconData('mouse-pointer');
  static ErplyIconData get alignLeft => const ErplyIconData('align-left');
  static ErplyIconData get heart => const ErplyIconData('heart');
  static ErplyIconData get trendingUp => const ErplyIconData('trending-up');
}
