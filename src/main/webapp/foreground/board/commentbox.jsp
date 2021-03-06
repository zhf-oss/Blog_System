<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="comments" class="comments">
    <div class="inner" id="commentInner">

        <style type="text/css">.halo-co0  mment {
            position: relative;
            font-family: PingFang SC, Hiragino Sans GB, Microsoft YaHei, STHeiti, WenQuanYi Micro Hei, Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight: 500;
            line-height: 1.8;
            margin: 0 auto;
            color: #313131;
            text-rendering: geometricPrecision;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale
        }

        .halo-comment a {
            text-decoration: none;
            color: #666
        }

        .halo-comment input::-webkit-input-placeholder, .halo-comment textarea::-webkit-input-placeholder {
            color: #ccc
        }

        .halo-comment a, .halo-comment abbr, .halo-comment acronym, .halo-comment address, .halo-comment applet, .halo-comment big, .halo-comment blockquote, .halo-comment body, .halo-comment caption, .halo-comment cite, .halo-comment code, .halo-comment dd, .halo-comment del, .halo-comment dfn, .halo-comment div, .halo-comment dl, .halo-comment dt, .halo-comment em, .halo-comment fieldset, .halo-comment figure, .halo-comment form, .halo-comment h1, .halo-comment h2, .halo-comment h3, .halo-comment h4, .halo-comment h5, .halo-comment h6, .halo-comment html, .halo-comment iframe, .halo-comment ins, .halo-comment kbd, .halo-comment label, .halo-comment legend, .halo-comment li, .halo-comment object, .halo-comment ol, .halo-comment p, .halo-comment pre, .halo-comment q, .halo-comment s, .halo-comment samp, .halo-comment small, .halo-comment span, .halo-comment strike, .halo-comment strong, .halo-comment sub, .halo-comment sup, .halo-comment table, .halo-comment tbody, .halo-comment td, .halo-comment tfoot, .halo-comment th, .halo-comment thead, .halo-comment tr, .halo-comment tt, .halo-comment ul, .halo-comment var {
            border: 0;
            font-size: 100%;
            font-style: inherit;
            font-weight: inherit;
            margin: 0;
            outline: 0;
            padding: 0;
            vertical-align: baseline
        }

        .halo-comment button, .halo-comment input, .halo-comment textarea {
            -webkit-appearance: none;
            outline: none;
            -webkit-tap-highlight-color: rgba(0, 0, 0, 0)
        }

        .halo-comment button:focus, .halo-comment input:focus, .halo-comment textarea:focus {
            outline: none
        }

        .halo-comment ol, .halo-comment ul {
            list-style: none
        }

        .halo-comment .middle {
            display: inline-block;
            vertical-align: middle
        }

        .halo-comment .avatar {
            display: block;
            -o-object-fit: cover;
            object-fit: cover;
            border-radius: 100%;
            width: 3.125em;
            height: 3.125em;
            cursor: pointer;
            -webkit-transition: all .8s;
            transition: all .8s
        }

        .halo-comment .avatar:hover {
            -webkit-transform: rotate(1turn);
            transform: rotate(1turn)
        }

        .halo-comment .comment-editor {
            position: relative;
            z-index: 1;
            -webkit-animation: top20 .5s;
            animation: top20 .5s
        }

        .halo-comment .comment-editor .inner {
            margin: auto;
            padding: 20px 0
        }

        .halo-comment .comment-form {
            border: 1px solid #f0f0f0;
            border-radius: 4px;
            margin-bottom: 10px;
            overflow: hidden;
            position: relative;
            padding: 10px
        }

        .halo-comment .comment-form input, .halo-comment .comment-form textarea {
            -webkit-box-shadow: none;
            box-shadow: none;
            resize: vertical;
            font-size: 14px;
            line-height: 20px;
            padding: .7111em 1em;
            background: #fff;
            border: none;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 0;
            color: #333;
            outline: none;
            -webkit-appearance: none
        }

        .halo-comment .comment-form input:focus, .halo-comment .comment-form textarea:focus {
            border-color: #ccc
        }

        .halo-comment .commentator {
            position: relative;
            float: left
        }

        .halo-comment .author-info {
            position: relative;
            overflow: hidden;
            margin-bottom: 10px;
            border-bottom: 1px solid #f0f0f0
        }

        .halo-comment .author-info input {
            font-size: 12px;
            float: left;
            width: 32%;
            margin-right: 2%
        }

        .halo-comment .author-info input#authorUrl {
            margin: 0
        }

        .halo-comment .comment-textarea {
            position: relative;
            width: 100%
        }

        .halo-comment .comment-textarea textarea {
            background: url(https://cdn.jsdelivr.net/gh/coortop/halo-comment-alex@latest/src/images/comment_bg.png) 100% 100% no-repeat;
            background-size: contain;
            font-size: 14px;
            line-height: 18px;
            width: 100%;
            min-height: 120px;
            -webkit-transition: all .25s ease-in-out 0s;
            transition: all .25s ease-in-out 0s;
            color: #000;
            overflow: hidden;
            overflow-wrap: break-word;
            resize: none;
            font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol
        }

        .halo-comment .comment-textarea textarea:focus {
            background-position-y: 105px;
            -webkit-transition: all .25s ease-in-out 0s;
            transition: all .25s ease-in-out 0s
        }

        .halo-comment .comment.index-1 > ol.children {
            padding-left: 1.2rem
        }

        .halo-comment .children img.avatar {
            width: 2.225em;
            height: 2.225em
        }

        .halo-comment .children .contain-main {
            margin-left: 48px
        }

        .halo-comment .comment-preview {
            position: relative;
            width: 100%;
            min-height: 90px;
            -webkit-box-shadow: none;
            box-shadow: none;
            border: 1px solid #e1e8ed;
            border-radius: 5px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            margin-bottom: 10px;
            overflow-wrap: break-word
        }

        .halo-comment .comment-preview img {
            max-width: 100%
        }

        .halo-comment .comment-buttons {
            font-size: 12px;
            text-align: right;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            display: -webkit-flex;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between
        }

        .halo-comment .comment-buttons .button-preview-edit, .halo-comment .comment-buttons .button-submit {
            -webkit-animation: bottom20 .5s;
            animation: bottom20 .5s;
            border: 1px solid #666;
            font-weight: 500;
            padding: 3px 12px;
            text-transform: uppercase;
            border-radius: 4px;
            display: inline-block;
            -webkit-transition: all .3s ease 0s;
            transition: all .3s ease 0s
        }

        .halo-comment .comment-buttons .button-preview-edit:hover, .halo-comment .comment-buttons .button-submit:hover {
            color: #1890ff;
            border: 1px solid #1890ff;
            font-weight: 700;
            background: none;
            -webkit-transition: all .3s ease 0s;
            transition: all .3s ease 0s
        }

        .halo-comment .comment-buttons .comment-icon {
            margin-left: 10px;
            cursor: pointer;
            display: inline-block;
            overflow: hidden;
            fill: #555;
            vertical-align: middle
        }

        .halo-comment .comment-buttons .comment-icon:hover {
            cursor: pointer
        }

        .halo-comment .comment-buttons .comment-icon.actived {
            fill: #66b1ff
        }

        .halo-comment .comment-loader-container {
            -webkit-animation: top20 .5s;
            animation: top20 .5s;
            position: relative;
            text-align: center;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            margin: 30px 0
        }

        .halo-comment .comment-loader-container .comment-loader-default {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-flow: row nowrap;
            flex-flow: row nowrap;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
            width: 30px
        }

        .halo-comment .comment-loader-container .comment-loader-default span {
            width: 4px;
            height: 15px;
            background-color: #898c7b
        }

        .halo-comment .comment-loader-container .comment-loader-default span:first-of-type {
            -webkit-animation: grow 1s ease-in-out -.45s infinite;
            animation: grow 1s ease-in-out -.45s infinite
        }

        .halo-comment .comment-loader-container .comment-loader-default span:nth-of-type(2) {
            -webkit-animation: grow 1s ease-in-out -.3s infinite;
            animation: grow 1s ease-in-out -.3s infinite
        }

        .halo-comment .comment-loader-container .comment-loader-default span:nth-of-type(3) {
            -webkit-animation: grow 1s ease-in-out -.15s infinite;
            animation: grow 1s ease-in-out -.15s infinite
        }

        .halo-comment .comment-loader-container .comment-loader-default span:nth-of-type(4) {
            -webkit-animation: grow 1s ease-in-out infinite;
            animation: grow 1s ease-in-out infinite
        }

        @-webkit-keyframes grow {
            0%, to {
                -webkit-transform: scaleY(1);
                transform: scaleY(1)
            }
            50% {
                -webkit-transform: scaleY(2);
                transform: scaleY(2)
            }
        }

        @keyframes grow {
            0%, to {
                -webkit-transform: scaleY(1);
                transform: scaleY(1)
            }
            50% {
                -webkit-transform: scaleY(2);
                transform: scaleY(2)
            }
        }

        .halo-comment .comment-loader-container .comment-loader-circle {
            border: 3px solid #898c7b;
            border-top-color: #fff;
            border-radius: 50%;
            width: 2.5em;
            height: 2.5em;
            -webkit-animation: spin .7s linear infinite;
            animation: spin .7s linear infinite
        }

        @-webkit-keyframes spin {
            to {
                -webkit-transform: rotate(1turn);
                transform: rotate(1turn)
            }
        }

        @keyframes spin {
            to {
                -webkit-transform: rotate(1turn);
                transform: rotate(1turn)
            }
        }

        .halo-comment .comment-loader-container .comment-loader-balls {
            width: 3.5em;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -webkit-box-direction: normal;
            -ms-flex-flow: row nowrap;
            flex-flow: row nowrap;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between
        }

        .halo-comment .comment-loader-container .comment-loader-balls div {
            width: .7em;
            height: .7em;
            border-radius: 50%;
            background-color: #898c7b;
            -webkit-transform: translateY(-100%);
            transform: translateY(-100%);
            -webkit-animation: wave .7s ease-in-out infinite alternate;
            animation: wave .7s ease-in-out infinite alternate
        }

        .halo-comment .comment-loader-container .comment-loader-balls div:first-of-type {
            -webkit-animation-delay: -.4s;
            animation-delay: -.4s
        }

        .halo-comment .comment-loader-container .comment-loader-balls div:nth-of-type(2) {
            -webkit-animation-delay: -.2s;
            animation-delay: -.2s
        }

        @-webkit-keyframes wave {
            0% {
                -webkit-transform: translateY(-100%);
                transform: translateY(-100%)
            }
            to {
                -webkit-transform: translateY(100%);
                transform: translateY(100%)
            }
        }

        @keyframes wave {
            0% {
                -webkit-transform: translateY(-100%);
                transform: translateY(-100%)
            }
            to {
                -webkit-transform: translateY(100%);
                transform: translateY(100%)
            }
        }

        .halo-comment .comment-nodes {
            -webkit-animation: top20 1s;
            animation: top20 1s;
            position: relative
        }

        .halo-comment .comment-nodes .comment-editor {
            -webkit-animation: bottom20 .5s;
            animation: bottom20 .5s
        }

        .halo-comment .comment-nodes .comment-editor .inner {
            padding: 7px 0 12px
        }

        .halo-comment .comment-empty, .halo-comment .comment-load-button {
            margin: 30px 0;
            text-align: center
        }

        .halo-comment .comment-empty {
            color: #8899a6
        }

        .halo-comment .comment-page {
            margin-top: 30px;
            text-align: center;
            border-top: 3px solid #f5f8fa
        }

        .halo-comment .comment-page .page {
            display: inline-block;
            padding: 10px 0;
            margin: 0
        }

        .halo-comment .comment-page .page li {
            display: inline;
            margin-right: 5px
        }

        .halo-comment .comment-page .page button {
            margin-bottom: 8px;
            position: relative;
            font-size: inherit;
            font-family: inherit;
            padding: 5px 10px;
            border: 1px solid #d9d9d9;
            border-radius: 4px;
            cursor: pointer;
            -webkit-transition: all .8s;
            transition: all .8s;
            font-weight: 400;
            color: rgba(0, 0, 0, .65);
            background-color: #fff
        }

        .halo-comment .comment-page .page .active, .halo-comment .comment-page .page button:hover {
            color: #1890ff;
            border-color: #1890ff
        }

        .halo-comment .comment-nodes .index-1 {
            overflow: hidden;
            margin-top: 30px;
            padding-bottom: 20px;
            border-bottom: 3px solid #f5f8fa
        }

        .halo-comment .comment-nodes li:last-child {
            border: 0
        }

        .halo-comment .comment-nodes .commentator a:after, .halo-comment .comment-nodes .commentator a:before {
            display: none
        }

        .halo-comment .comment-body {
            position: relative;
            margin: 0 auto;
            padding: 0
        }

        .halo-comment .comment-avatar {
            position: relative;
            z-index: 1;
            float: left;
            padding: 0
        }

        .halo-comment .contain-main {
            margin-left: 58px
        }

        .halo-comment .comment-meta {
            line-height: 1
        }

        .halo-comment .comment-meta .useragent-info {
            font-size: 10px;
            color: #b3b3b3
        }

        @media only screen and (max-width: 768px) {
            .halo-comment .comment-meta .useragent-info {
                display: block
            }
        }

        .halo-comment .comment-author {
            font-size: 14px
        }

        .halo-comment .comment-author .author-name {
            font-size: 16px;
            font-weight: 700;
            margin-right: 10px
        }

        .halo-comment .is-admin {
            margin-left: 4px;
            font-size: 14px;
            cursor: pointer
        }

        .halo-comment .comment-time {
            display: inline-block;
            margin-top: 6px;
            font-size: 10px;
            color: #b3b3b3
        }

        .halo-comment .comment-id {
            display: block;
            float: right;
            margin-top: 6px;
            font-size: 12px;
            color: #657786
        }

        .halo-comment .comment-content {
            padding: 20px 20px 19px 0;
            font-size: 14px;
            color: #4a5568
        }

        .halo-comment .comment-content p {
            margin: 0
        }

        .halo-comment .comment-content p img {
            max-width: 50%
        }

        .halo-comment .comment-content.markdown-body > p {
            margin-left: .5rem
        }

        .halo-comment .comment-content.markdown-body a {
            color: #1890ff
        }

        .halo-comment .comment-reply {
            float: right;
            font-size: 12px;
            color: #ff5f5f;
            padding: 1px 5px;
            border-radius: 3px;
            line-height: 1.5;
            -webkit-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out
        }

        .halo-comment .comment-alert {
            margin-top: 10px
        }

        .halo-comment .comment-pre-content {
            padding: 7px;
            -webkit-box-shadow: 0 0 1px #f0f0f0;
            box-shadow: 0 0 1px #f0f0f0
        }

        .halo-comment .alert {
            -webkit-animation: top20 .5s;
            animation: top20 .5s;
            border-radius: 4px;
            padding: 8px 16px;
            background-color: #f44336;
            color: #fff;
            opacity: 1;
            -webkit-transition: opacity .6s;
            transition: opacity .6s;
            margin-top: 10px
        }

        .halo-comment .alert.success {
            background-color: #4caf50
        }

        .halo-comment .alert.info {
            background-color: #2196f3
        }

        .halo-comment .alert.warning {
            background-color: #ff9800
        }

        .halo-comment .alert .closebtn {
            margin-left: 15px;
            color: #fff;
            font-weight: 700;
            float: right;
            font-size: 22px;
            line-height: 16px;
            cursor: pointer;
            -webkit-transition: .3s;
            transition: .3s
        }

        .halo-comment .alert .closebtn:hover {
            color: #000
        }

        @media only screen and (max-width: 900px) {
            .halo-comment .comment-reply {
                display: block
            }
        }

        @-webkit-keyframes top20 {
            0% {
                opacity: 0;
                -webkit-transform: translateY(-20px);
                transform: translateY(-20px)
            }
            to {
                opacity: 1;
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
        }

        @keyframes top20 {
            0% {
                opacity: 0;
                -webkit-transform: translateY(-20px);
                transform: translateY(-20px)
            }
            to {
                opacity: 1;
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
        }

        @-webkit-keyframes bottom20 {
            0% {
                opacity: 0;
                -webkit-transform: translateY(20px);
                transform: translateY(20px)
            }
            to {
                opacity: 1;
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
        }

        @keyframes bottom20 {
            0% {
                opacity: 0;
                -webkit-transform: translateY(20px);
                transform: translateY(20px)
            }
            to {
                opacity: 1;
                -webkit-transform: translateY(0);
                transform: translateY(0)
            }
        }

        .halo-comment #EmojiPicker {
            font-family: Noto, Twemoji, NotomojiColor, Notomoji, Symbola, sans-serif;
            display: -ms-inline-flexbox;
            display: inline-flex;
            -webkit-box-orient: vertical;
            -ms-flex-direction: column;
            flex-direction: column;
            overflow: hidden;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none
        }

        .halo-comment #EmojiPicker, .halo-comment #EmojiPicker #Categories {
            -webkit-box-direction: normal;
            -webkit-box-align: center;
            -ms-flex-align: center;
            align-items: center;
            width: 100%
        }

        .halo-comment #EmojiPicker #Categories {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-orient: horizontal;
            -ms-flex-direction: row;
            flex-direction: row;
            border-bottom: 1px solid #e4e4e4;
            background: #f0f0f0;
            color: #fff
        }

        .halo-comment #EmojiPicker .category {
            -webkit-box-flex: 1;
            -ms-flex: 1;
            flex: 1;
            padding-top: 5px;
            padding-bottom: 5px;
            text-align: center;
            cursor: pointer
        }

        .halo-comment #EmojiPicker .category.active {
            border-bottom: 3px solid #009688;
            -webkit-filter: saturate(3);
            filter: saturate(3);
            padding-bottom: 2px
        }

        .halo-comment #EmojiPicker .category > img {
            width: 22px;
            height: 22px
        }

        .halo-comment #EmojiPicker .category:hover {
            -webkit-filter: saturate(3);
            filter: saturate(3)
        }

        .halo-comment #EmojiPicker #InputSearch {
            display: block;
            width: 100%;
            max-width: 100%
        }

        .halo-comment #EmojiPicker .container-search {
            display: block;
            -webkit-box-pack: center;
            -ms-flex-pack: center;
            justify-content: center;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            width: 100%;
            margin: 5px 0;
            padding: 0 5%
        }

        .halo-comment #EmojiPicker .container-search input {
            width: 100%;
            font-size: 14px;
            padding: 8px;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 4px;
            background: #f6f6f6;
            color: #4a4a4a;
            border: 1px solid #e2e2e2
        }

        .halo-comment #EmojiPicker #Emojis {
            display: block;
            width: 100%;
            max-width: 100%;
            margin-top: 5px
        }

        .halo-comment #EmojiPicker #Emojis ::-webkit-scrollbar {
            border-radius: 4px;
            width: 4px;
            background: hsla(0, 0%, 48.6%, .36)
        }

        .halo-comment #EmojiPicker #Emojis ::-webkit-scrollbar-track {
            border-radius: 4px
        }

        .halo-comment #EmojiPicker #Emojis ::-webkit-scrollbar-thumb {
            border-radius: 4px;
            background: rgba(0, 0, 0, .22)
        }

        .halo-comment #EmojiPicker #Emojis ::-webkit-scrollbar-thumb:hover {
            background: rgba(0, 0, 0, .38)
        }

        .halo-comment #EmojiPicker .container-emoji {
            overflow-x: hidden;
            overflow-y: scroll;
            max-height: 200px
        }

        .halo-comment #EmojiPicker .category-title {
            text-transform: uppercase;
            font-size: .8em;
            padding: 5px 0 0 16px;
            color: #848484
        }

        .halo-comment #EmojiPicker .category-title:not(:first-of-type) {
            padding: 10px 0 0 16px
        }

        .halo-comment #EmojiPicker .grid-emojis {
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -webkit-box-pack: start;
            -ms-flex-pack: start;
            justify-content: flex-start;
            margin: 5px 0;
            -webkit-box-align: start;
            -ms-flex-align: start;
            align-items: start
        }

        .halo-comment #EmojiPicker .emoji {
            display: inline-block;
            text-align: center;
            font-size: 16px;
            padding: 5px 10px;
            max-height: 30px;
            cursor: pointer
        }

        .halo-comment #EmojiPicker #VSvg {
            display: inline-block;
            vertical-align: middle
        }

        .dark-mode input, .dark-mode textarea {
            background-color: #232125 !important;
            color: #a9a9b3 !important;
            border: none !important
        }

        .dark-mode img {
            -webkit-filter: brightness(.6) !important;
            filter: brightness(.6) !important
        }

        .dark-mode .comment-form {
            border: 1px solid rgba(35, 36, 38, .96) !important;
            border-radius: 0
        }

        .dark-mode .comment-count {
            color: #a9a9b3 !important
        }

        .dark-mode .comment-pre-content {
            background-color: #232125 !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important
        }

        .dark-mode .comment-pre-content .markdown-body {
            color: #a9a9b3 !important
        }

        .dark-mode .comment-content {
            background-color: #292a2d !important;
            color: #a9a9b3 !important;
            border: none !important
        }

        .dark-mode .comment-preview {
            background-color: #232125 !important;
            color: #a9a9b3 !important;
            border: none !important
        }

        .dark-mode .comment-nodes .index-1 {
            border-bottom: 3px solid #36393c
        }

        .dark-mode .comment-page {
            border-top: 3px solid #36393c
        }

        .dark-mode .comment-page .page button {
            background-color: #676a6c;
            color: #fff;
            border: 1px solid #676a6c
        }

        .vemoji {
            max-width: 25px !important;
            vertical-align: text-bottom;
            margin: 0 1px;
            display: inline-block
        }

        @media (max-width: 520px) {
            .halo-comment .author-info input {
                width: 100%
            }
        }

        @font-face {
            font-family: octicons-link;
            src: url(data:font/woff;charset=utf-8;base64,d09GRgABAAAAAAZwABAAAAAACFQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABEU0lHAAAGaAAAAAgAAAAIAAAAAUdTVUIAAAZcAAAACgAAAAoAAQAAT1MvMgAAAyQAAABJAAAAYFYEU3RjbWFwAAADcAAAAEUAAACAAJThvmN2dCAAAATkAAAABAAAAAQAAAAAZnBnbQAAA7gAAACyAAABCUM+8IhnYXNwAAAGTAAAABAAAAAQABoAI2dseWYAAAFsAAABPAAAAZwcEq9taGVhZAAAAsgAAAA0AAAANgh4a91oaGVhAAADCAAAABoAAAAkCA8DRGhtdHgAAAL8AAAADAAAAAwGAACfbG9jYQAAAsAAAAAIAAAACABiATBtYXhwAAACqAAAABgAAAAgAA8ASm5hbWUAAAToAAABQgAAAlXu73sOcG9zdAAABiwAAAAeAAAAME3QpOBwcmVwAAAEbAAAAHYAAAB/aFGpk3jaTY6xa8JAGMW/O62BDi0tJLYQincXEypYIiGJjSgHniQ6umTsUEyLm5BV6NDBP8Tpts6F0v+k/0an2i+itHDw3v2+9+DBKTzsJNnWJNTgHEy4BgG3EMI9DCEDOGEXzDADU5hBKMIgNPZqoD3SilVaXZCER3/I7AtxEJLtzzuZfI+VVkprxTlXShWKb3TBecG11rwoNlmmn1P2WYcJczl32etSpKnziC7lQyWe1smVPy/Lt7Kc+0vWY/gAgIIEqAN9we0pwKXreiMasxvabDQMM4riO+qxM2ogwDGOZTXxwxDiycQIcoYFBLj5K3EIaSctAq2kTYiw+ymhce7vwM9jSqO8JyVd5RH9gyTt2+J/yUmYlIR0s04n6+7Vm1ozezUeLEaUjhaDSuXHwVRgvLJn1tQ7xiuVv/ocTRF42mNgZGBgYGbwZOBiAAFGJBIMAAizAFoAAABiAGIAznjaY2BkYGAA4in8zwXi+W2+MjCzMIDApSwvXzC97Z4Ig8N/BxYGZgcgl52BCSQKAA3jCV8CAABfAAAAAAQAAEB42mNgZGBg4f3vACQZQABIMjKgAmYAKEgBXgAAeNpjYGY6wTiBgZWBg2kmUxoDA4MPhGZMYzBi1AHygVLYQUCaawqDA4PChxhmh/8ODDEsvAwHgMKMIDnGL0x7gJQCAwMAJd4MFwAAAHjaY2BgYGaA4DAGRgYQkAHyGMF8NgYrIM3JIAGVYYDT+AEjAwuDFpBmA9KMDEwMCh9i/v8H8sH0/4dQc1iAmAkALaUKLgAAAHjaTY9LDsIgEIbtgqHUPpDi3gPoBVyRTmTddOmqTXThEXqrob2gQ1FjwpDvfwCBdmdXC5AVKFu3e5MfNFJ29KTQT48Ob9/lqYwOGZxeUelN2U2R6+cArgtCJpauW7UQBqnFkUsjAY/kOU1cP+DAgvxwn1chZDwUbd6CFimGXwzwF6tPbFIcjEl+vvmM/byA48e6tWrKArm4ZJlCbdsrxksL1AwWn/yBSJKpYbq8AXaaTb8AAHja28jAwOC00ZrBeQNDQOWO//sdBBgYGRiYWYAEELEwMTE4uzo5Zzo5b2BxdnFOcALxNjA6b2ByTswC8jYwg0VlNuoCTWAMqNzMzsoK1rEhNqByEyerg5PMJlYuVueETKcd/89uBpnpvIEVomeHLoMsAAe1Id4AAAAAAAB42oWQT07CQBTGv0JBhagk7HQzKxca2sJCE1hDt4QF+9JOS0nbaaYDCQfwCJ7Au3AHj+LO13FMmm6cl7785vven0kBjHCBhfpYuNa5Ph1c0e2Xu3jEvWG7UdPDLZ4N92nOm+EBXuAbHmIMSRMs+4aUEd4Nd3CHD8NdvOLTsA2GL8M9PODbcL+hD7C1xoaHeLJSEao0FEW14ckxC+TU8TxvsY6X0eLPmRhry2WVioLpkrbp84LLQPGI7c6sOiUzpWIWS5GzlSgUzzLBSikOPFTOXqly7rqx0Z1Q5BAIoZBSFihQYQOOBEdkCOgXTOHA07HAGjGWiIjaPZNW13/+lm6S9FT7rLHFJ6fQbkATOG1j2OFMucKJJsxIVfQORl+9Jyda6Sl1dUYhSCm1dyClfoeDve4qMYdLEbfqHf3O/AdDumsjAAB42mNgYoAAZQYjBmyAGYQZmdhL8zLdDEydARfoAqIAAAABAAMABwAKABMAB///AA8AAQAAAAAAAAAAAAAAAAABAAAAAA==) format("woff")
        }

        .markdown-body {
            -ms-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
            color: #24292e;
            font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
            font-size: 16px;
            line-height: 1.5;
            word-wrap: break-word
        }

        .markdown-body .octicon {
            display: inline-block;
            fill: currentColor;
            vertical-align: text-bottom
        }

        .markdown-body .anchor {
            float: left;
            line-height: 1;
            margin-left: -20px;
            padding-right: 4px
        }

        .markdown-body .anchor:focus {
            outline: none
        }

        .markdown-body details {
            display: block
        }

        .markdown-body details summary {
            cursor: pointer
        }

        .markdown-body summary {
            display: list-item
        }

        .markdown-body a {
            background-color: transparent;
            text-decoration: none
        }

        .markdown-body a:hover {
            text-decoration: underline
        }

        .markdown-body a:not([href]) {
            color: inherit;
            text-decoration: none
        }

        .markdown-body strong {
            font-weight: inherit;
            font-weight: bolder;
            font-weight: 600
        }

        .markdown-body h1 {
            margin: .67em 0;
            font-size: 32px;
            font-size: 2em
        }

        .markdown-body img {
            border-style: none;
            background-color: #fff;
            max-width: 100%
        }

        .markdown-body hr, .markdown-body img {
            -webkit-box-sizing: content-box;
            box-sizing: content-box
        }

        .markdown-body hr {
            overflow: visible;
            background: transparent;
            border-bottom: 1px solid #dfe2e5;
            height: 0;
            margin: 15px 0;
            overflow: hidden;
            background-color: #e1e4e8;
            border: 0;
            height: .25em;
            margin: 24px 0;
            padding: 0;
            border-bottom-color: #eee
        }

        .markdown-body hr:after, .markdown-body hr:before {
            content: "";
            display: table
        }

        .markdown-body hr:after {
            clear: both
        }

        .markdown-body input {
            font: inherit;
            margin: 0;
            overflow: visible;
            font-family: inherit;
            font-size: inherit;
            line-height: inherit
        }

        .markdown-body [type=checkbox] {
            padding: 0
        }

        .markdown-body *, .markdown-body [type=checkbox] {
            -webkit-box-sizing: border-box;
            box-sizing: border-box
        }

        .markdown-body table {
            border-collapse: collapse;
            border-spacing: 0;
            display: block;
            overflow: auto;
            width: 100%
        }

        .markdown-body table th {
            font-weight: 600
        }

        .markdown-body table tr {
            background-color: #fff;
            border-top: 1px solid #c6cbd1
        }

        .markdown-body table tr:nth-child(2n) {
            background-color: #f6f8fa
        }

        .markdown-body h2 {
            font-size: 24px;
            font-size: 1.5em
        }

        .markdown-body h3 {
            font-size: 20px;
            font-size: 1.25em
        }

        .markdown-body h4 {
            font-size: 16px;
            font-size: 1em
        }

        .markdown-body h5 {
            font-size: 14px;
            font-size: .875em
        }

        .markdown-body h6 {
            font-size: 12px;
            color: #6a737d;
            font-size: .85em
        }

        .markdown-body p {
            margin-bottom: 10px;
            margin-top: 0
        }

        .markdown-body blockquote {
            margin: 0;
            border-left: .25em solid #dfe2e5;
            color: #6a737d;
            padding: 0 1em
        }

        .markdown-body blockquote > :first-child {
            margin-top: 0
        }

        .markdown-body blockquote > :last-child {
            margin-bottom: 0
        }

        .markdown-body dd {
            margin-left: 0
        }

        .markdown-body pre {
            margin-bottom: 0;
            margin-top: 0;
            word-wrap: normal
        }

        .markdown-body pre > code {
            background: transparent;
            border: 0;
            font-size: 100%;
            margin: 0;
            padding: 0;
            white-space: pre;
            word-break: normal
        }

        .markdown-body pre code {
            background-color: transparent;
            border: 0;
            display: inline;
            line-height: inherit;
            margin: 0;
            overflow: visible;
            padding: 0;
            word-wrap: normal
        }

        .markdown-body li {
        }

        .markdown-body li > p {
            margin-top: 16px
        }

        .markdown-body li + li {
            margin-top: .25em
        }

        .markdown-body dl {
            padding: 0
        }

        .markdown-body dl dt {
            font-size: 1em;
            font-style: italic;
            font-weight: 600;
            margin-top: 16px;
            padding: 0
        }

        .markdown-body dl dd {
            margin-bottom: 16px;
            padding: 0 16px
        }

        .markdown-body img[align=right] {
            padding-left: 20px
        }

        .markdown-body img[align=left] {
            padding-right: 20px
        }

        .markdown-body code {
            background-color: rgba(27, 31, 35, .05);
            border-radius: 3px;
            font-size: 85%;
            margin: 0;
            padding: .2em .4em
        }

        .markdown-body .highlight {
            margin-bottom: 16px
        }

        .markdown-body .highlight pre {
            margin-bottom: 0;
            word-break: normal
        }

        .markdown-body a:active, .markdown-body a:hover {
            outline-width: 0
        }

        .markdown-body code, .markdown-body pre {
            font-family: monospace, monospace;
            font-size: 1em
        }

        .markdown-body td, .markdown-body th {
            padding: 0
        }

        .markdown-body h1, .markdown-body h2, .markdown-body h3, .markdown-body h4, .markdown-body h5, .markdown-body h6 {
            margin-bottom: 0;
            margin-top: 0;
            font-weight: 600;
            line-height: 1.25;
            margin-bottom: 16px;
            margin-top: 24px
        }

        .markdown-body h1, .markdown-body h2 {
            font-weight: 600;
            border-bottom: 1px solid #eaecef;
            padding-bottom: .3em
        }

        .markdown-body h3, .markdown-body h4, .markdown-body h5, .markdown-body h6 {
            font-weight: 600
        }

        .markdown-body ol, .markdown-body ul {
            margin-bottom: 0;
            margin-top: 0;
            padding-left: 0;
            padding-left: 2em
        }

        .markdown-body ol ol, .markdown-body ul ol {
            list-style-type: lower-roman
        }

        .markdown-body ol ol ol, .markdown-body ol ul ol, .markdown-body ul ol ol, .markdown-body ul ul ol {
            list-style-type: lower-alpha
        }

        .markdown-body code, .markdown-body pre {
            font-family: SFMono-Regular, Consolas, Liberation Mono, Menlo, Courier, monospace;
            font-size: 12px
        }

        .markdown-body input::-webkit-inner-spin-button, .markdown-body input::-webkit-outer-spin-button {
            -webkit-appearance: none;
            appearance: none;
            margin: 0
        }

        .markdown-body blockquote, .markdown-body dl, .markdown-body ol, .markdown-body p, .markdown-body pre, .markdown-body table, .markdown-body ul {
            margin-bottom: 16px;
            margin-top: 0
        }

        .markdown-body ol ol, .markdown-body ol ul, .markdown-body ul ol, .markdown-body ul ul {
            margin-bottom: 0;
            margin-top: 0
        }

        .markdown-body table td, .markdown-body table th {
            border: 1px solid #dfe2e5;
            padding: 6px 13px
        }

        .markdown-body .highlight pre, .markdown-body pre {
            background-color: #f6f8fa;
            border-radius: 3px;
            font-size: 85%;
            line-height: 1.45;
            overflow: auto;
            padding: 16px
        }</style>
        <div id="halo-comment" class="halo-comment">
            <section role="form" class="comment-editor">
                <div class="inner">
                    <form class="comment-form" action="${pageContext.request.contextPath}/message/list.html" method="post">

                        <div class="author-info">
                            <!-- 评论人的昵称 -->
                            <input type="text" id="commentName" name="commentName" tabindex="1" required="required" aria-required="true" placeholder="* 昵称" class="comment-input author">
                            <!-- 评论的邮件 -->
                            <input type="text" id="email" name="email" tabindex="2" required="required" aria-required="true" placeholder="* 电子邮件" class="comment-input email">
                            <!-- 评论人的个人站点地址 -->
                            <input type="text" id="sizeUrl" name="sizeUrl" tabindex="3" placeholder="个人站点(https://)" class="comment-input link" style="float: right;width: 180px;">
                        </div>

                        <!-- 评论框，写要评论的内容 -->
                        <div class="comment-textarea">
                            <textarea cols="10" rows="5" required="required" id="content" name="content" aria-required="true" tabindex="4" placeholder="留 下 你 的 足 迹 ！"></textarea>
                        </div>

                        <ul class="comment-buttons">
                            <!-- 提交的按钮 -->
                            <li class="middle">
                                <input type="submit" value="提交" class="button-submit" style="height: 30px; border-color: grey;"/>
                            </li>
                        </ul>
                        <div class="comment-alert"></div>

                    </form>
                </div>
            </section>
            <div class="comment-count"><span class="vnum">${getTotal }</span> 评论</div><!---->

            <ol id="comment-nodes" class="comment-nodes">
                <c:forEach var="message" items="${messageList }" varStatus="status">
                    <c:if test="${message.state==1}">
                        <li id="li-comment-259" itemtype="http://schema.org/Comment" itemprop="comment"
                            class="comment index-1">
                            <div id="comment-259" class="comment-body">
                                <div class="comment-avatar">
                                    <a href="" rel="nofollow" target="_blank">
                                        <img alt="Jack's avatar" src="${pageContext.request.contextPath}/static/images/1.jpg" class="avatar">
                                    </a>
                                </div>
                                <div class="contain-main" style="margin-left: 8%;">
                                    <div class="comment-meta" style="padding-top: 5px;">
                                        <div itemprop="author" class="comment-author">
                                            <!-- 评论人的昵称 -->
                                            <a href="" rel="nofollow" target="_self" class="author-name">
                                                    ${message.commentName }
                                            </a>
                                            <!-- 使用什么软件评论的 -->
                                            <span class="useragent-info">HUAWEI</span>
                                        </div>
                                        <div class="comment-info">
                                            <!-- 评论时间 -->
                                            <time itemprop="datePublished" datetime="1596439437186" class="comment-time">
                                                    ${messageTimeList.get(status.index) }
                                            </time>
                                            <span class="comment-reply" style="cursor: pointer;">回复</span>
                                        </div>
                                    </div>
                                    <div itemprop="description" class="comment-content markdown-body">
                                        <p>
                                            <!-- 评论的表情 -->
                                            <img alt="lovely" referrerpolicy="no-referrer" class="vemoji" src="//img.t.sinajs.cn/t4/appstyle/expression/ext/normal/09/2018new_keai_org.png">&nbsp;
                                            <!-- 评论的内容 -->
                                                ${message.content }
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>
            </ol>

            <!-- 分页 -->
            <nav class="pagination" id="pagination">
                ${commentPageCode }
            </nav>

        </div>
    </div>
</div>
<script type="text/javascript">

    $(function () {
        var a = "${success3 }";
        if (a == 1) {
            alert("留言成功，博主审核中...");
        }
    });

</script>
