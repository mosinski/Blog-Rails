CKEDITOR.stylesSet.add('code_styles', [
  { name: 'Code Javascript', element: 'code', attributes: { 'lang': 'javascript' } },
  { name: 'Code Terminal', element: 'code', attributes: { 'lang': 'terminal' } },
  { name: 'Code Ruby', element: 'code', attributes: { 'lang': 'ruby' } },
  { name: 'Code HTML', element: 'code', attributes: { 'lang': 'html' } }
]);

CKEDITOR.editorConfig = function (config) {
  config.enterMode = CKEDITOR.ENTER_BR;
  config.ignoreEmptyParagraph = true;
  config.stylesSet = 'code_styles';
  config.fillEmptyBlocks = false;
  config.allowedContent = true;
  config.autoParagraph = false;
}
