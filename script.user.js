// ==UserScript==
// @name         Reddit Web Unblock
// @description  Unblocks the Reddit mobile website.
// @version      0.0.0
// @author       Hugo Marotta <humtta@proton.me>
//
// @copyright    © 2026 Hugo Marotta (https://github.com/humtta)
// @license      MIT
//
// @match        *://*.reddit.com/*
// @grant        none
// @run-at       document-start
//
// @namespace    https://github.com/humtta/reddit-web-unblock
// @icon         https://github.com/humtta/reddit-web-unblock/raw/main/src/assets/icon.svg
// @updateURL    https://github.com/humtta/reddit-web-unblock/raw/main/script.user.js
// @downloadURL  https://github.com/humtta/reddit-web-unblock/raw/main/script.user.js
// ==/UserScript==

(() => {
  const popupTags = [
    "app-upsell-blocking-bottom-sheet-direct",
    "app-upsell-blocking-bottom-sheet-seo",
  ];
  const popupSelector = popupTags.join(",");

  function removePopupFromNode(node) {
    if (!(node instanceof Element)) return;

    if (node.matches(popupSelector)) {
      node.remove();
      return;
    }

    node.querySelectorAll(popupSelector).forEach((el) => {
      el.remove();
    });
  }

  removePopupFromNode(document.documentElement);

  new MutationObserver((mutations) => {
    for (const mutation of mutations) {
      mutation.addedNodes.forEach(removePopupFromNode);
    }
  }).observe(document.documentElement, { childList: true, subtree: true });
})();
