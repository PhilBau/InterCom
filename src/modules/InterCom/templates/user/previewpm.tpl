﻿{* $Id$ *}

<div id="ic-previewform" class="z-form z-linear">
    <fieldset>
        <legend>{gt text="Message preview"}</legend>

        <div class="z-formrow z-clearfix">
            <label>{gt text="Recipient(s)"}</label>
            <p class="ic-readtext">
                {foreach from=$to_user item=item}
                <strong>{$item|profilelinkbyuname}</strong>
                {foreachelse}
                <strong>{gt text="Error! No recipient entered."}</strong>
                {/foreach}
            </p>
        </div>

        <div class="z-formrow z-clearfix">
            <div class="ic-floatleft">
                <label>{gt text="Subject line"}</label>
                <p class="ic-readtext">{$message.msg_subject}</p>
            </div>
            <div class="ic-floatright">
                <label>{gt text="Date"}</label>
                <p class="ic-readtext">{$smarty.now|dateformat:"datetimebrief"}</p>
            </div>
        </div>

        <div class="z-formrow">
            <label>{gt text="Message text"}</label>
            <div class="ic-readtext ic-messagetext">
                {$message.msg_text|nl2br}{* {$message.msg_text|nl2br|modcallhooks} *}
                {usergetvar name="_SIGNATURE" assign="signature"}
                {if $signature != ""}<div class="signature">{$signature|safehtml|nl2br}{* {$signature|safehtml|modcallhooks|nl2br} *}</div>{/if}
            </div>
        </div>

    </fieldset>
</div>
