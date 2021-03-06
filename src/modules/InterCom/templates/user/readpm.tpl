{* $Id$ *}
{gt text="Received message" assign=ictitle}
{include file="user/header.tpl" ictitle=$ictitle}

<div id="ic-readform" class="z-form">
    <fieldset>
        <legend>{$ictitle}</legend>

        <div class="z-formrow">
            {if $boxtype neq "outbox"}
            <label>{gt text="Sender"}</label>
            {else}
            <label>{gt text="Recipient"}</label>
            {/if}
            <span>
                <strong>{$message.uname|profilelinkbyuname}</strong>
                {modavailable modname="ContactList" assign="ContactListInstalled"}
                {if $ContactListInstalled && $boxtype neq "outbox"}
                <a href="{modurl modname="ContactList" type="user" func="create" uid=$message.from_userid}">{img modname="ContactList" src="user_add.png" __title="Add buddy" }</a>
                {/if}
            </span>
        </div>

        <div class="z-formrow">
            <label>{gt text="Date"}</label>
            <span>{$message.msg_time|dateformat:"datetimebrief"}</span>
        </div>

        <div class="z-formrow">
            <label>{gt text="Subject line"}</label>
            <span>{$message.msg_subject}</span>
        </div>

    </fieldset>

    <fieldset class="z-linear">
        <legend>{gt text="Message text"}</legend>
        <div class="z-formrow">
            <div>
                <div class="ic-readheaderright">{icuseravatar uid=$message.from_userid}</div>
                {$message.msg_text}
            </div>
            {if $message.signature != ""}<div class="signature z-formnote">{$message.signature|safehtml|nl2br}{* {$message.signature|safehtml|nl2br} *}</div>{/if}
        </div>
    </fieldset>

    <div class="z-formbuttons ic-buttons">
        {if $boxtype eq "inbox"}
        <a href="{modurl modname="InterCom" type="user" func="replyinbox" messageid=$message.msg_id}" title="{gt text='Reply'}">{img modname=core src=mail_reply.png set=icons/extrasmall __alt="Reply" __title="Reply"} {gt text="Reply"}</a>
        <a href="{modurl modname="InterCom" type="user" func="forwardfrominbox" messageid=$message.msg_id}" title="{gt text="Forward"}">{img modname=core src=mail_forward.png set=icons/extrasmall __alt="Forward" __title="Forward"} {gt text="Forward"}</a>
        <a href="{modurl modname="InterCom" type="user" func="storepm" messageid=$message.msg_id}" title="{gt text='Save'}">{img modname=InterCom src=save.png __alt="Save" __title="Save"} {gt text="Save"}</a>
        {/if}
        <a href="{modurl modname="InterCom" type="user" func="read`$boxtype`" messageid=$message.msg_id theme=printer}">{img modname='core' src='printer.png' set='icons/extrasmall' __alt="Print" __title="Print"} {gt text="Print"}</a>
        <a href="{modurl modname="InterCom" type="user" func="deletefrom`$boxtype`" messageid=$message.msg_id}" title="{gt text='Delete'}">{img modname='core' src='14_layer_deletelayer.png' set='icons/extrasmall' __alt="Delete" __title="Delete"} {gt text="Delete"}</a>
    </div>

</div>

{modavailable modname="ContactList" assign="ContactListInstalled"}
{if $ContactListInstalled}
{modapifunc modname="ContactList" type="user" func="getFOAFLink" uid1=$message.to_userid uid2=$message.from_userid}
{/if}

{include file="user/footer.tpl"}
