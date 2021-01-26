import PNotify from 'pnotify/dist/es/PNotify';
import PNotifyButtons from 'pnotify/dist/es/PNotifyButtons';

window.PNotify = PNotify

PNotify.defaults.styling = 'bootstrap4'
PNotify.defaults.icons = 'fontawesome4'
PNotify.defaults.stack = { dir1: 'up', dir2: 'right', firstpos1: 42, firstpos2: 42 }
PNotify.defaults.delay = 5000