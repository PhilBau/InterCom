{* $Id$ *}
<div id="ic_modal_content" style="display: none;">
    <p>{gt text="You have"}&nbsp;<strong>{$totalarray.unread}</strong>&nbsp;{gt text="new message(s)"}</p>
    <ul>
        <li><a href="{modurl modname="InterCom" func=inbox}">{gt text="Read message(s) now"}</a></li>
        <li><a href="#" onclick="Control.Modal.close()">{gt text="Close window"}</a></li>
    </ul>
</div>

<script type="text/javascript">
    m = new Control.Modal('ic_modal_content',{
        containerClassName: 'ic_modal_container',
        overlayClassName: 'ic_modal_overlay',
        width: 300,
        fade: true,
        fadeDuration: 0.5,
        contents: $('ic_modal_content').remove().innerHTML
    });
    m.open();
</script>
