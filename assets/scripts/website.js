$(document).ready(function () {
  const currentURL = window.location.href;
  const menuLink = document.querySelector(`#menu-aulas a[href="${currentURL}"]`);
  if (menuLink) {
    const menuModulo = $(menuLink).parents('.modulo-container').get(0);
    if (menuModulo) menuModulo.scrollIntoView();
  }
});
