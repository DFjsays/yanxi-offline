.class public Lcom/muta/yanxi/view/fragment/ChatFragment;
.super Lcom/muta/yanxi/view/fragment/IMChatFragment;
.source "SourceFile"

# interfaces
.implements Lcom/muta/yanxi/view/fragment/IMChatFragment$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/muta/yanxi/view/fragment/ChatFragment$a;
    }
.end annotation


# instance fields
.field private aqX:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Lcom/muta/yanxi/view/fragment/IMChatFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public a(ILandroid/view/View;)Z
    .locals 3

    .prologue
    .line 279
    packed-switch p1, :pswitch_data_0

    .line 291
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 281
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v1

    const-class v2, Lcom/muta/yanxi/emchat/ui/ImageGridActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 282
    const/16 v1, 0xb

    invoke-virtual {p0, v0, v1}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 285
    :pswitch_1
    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->rE()V

    goto :goto_0

    .line 279
    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bZ(Ljava/lang/String;)V
    .locals 4

    .prologue
    .line 233
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nF()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 234
    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/offline/OfflineProfileActivity;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivity(Landroid/content/Intent;)V

    .line 248
    :goto_0
    return-void

    .line 236
    :cond_0
    sget-object v0, Lcom/muta/yanxi/view/activity/HomePagesActivy;->amC:Lcom/muta/yanxi/view/activity/HomePagesActivy$a;

    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v1

    iget-object v2, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aaw:Ljava/lang/String;

    const-string v3, "0"

    invoke-virtual {v0, v1, p1, v2, v3}, Lcom/muta/yanxi/view/activity/HomePagesActivy$a;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public ca(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 252
    invoke-virtual {p0, p1}, Lcom/muta/yanxi/view/fragment/ChatFragment;->cb(Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method public g(Lcom/hyphenate/chat/EMMessage;)V
    .locals 2

    .prologue
    .line 204
    iget-boolean v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aqX:Z

    if-eqz v0, :cond_0

    .line 206
    const-string v0, "em_robot_message"

    iget-boolean v1, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aqX:Z

    invoke-virtual {p1, v0, v1}, Lcom/hyphenate/chat/EMMessage;->setAttribute(Ljava/lang/String;Z)V

    .line 208
    :cond_0
    return-void
.end method

.method public h(Lcom/hyphenate/chat/EMMessage;)Z
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 260
    .line 261
    const-string v0, "em_is_works"

    invoke-virtual {p1, v0, v3}, Lcom/hyphenate/chat/EMMessage;->getBooleanAttribute(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 263
    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v0

    const-string v1, "url"

    const-string v2, ""

    invoke-virtual {p1, v1, v2}, Lcom/hyphenate/chat/EMMessage;->getStringAttribute(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Lcom/muta/yanxi/view/activity/WebActivity;->d(Landroid/content/Context;Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivity(Landroid/content/Intent;)V

    .line 266
    :cond_0
    return v3
.end method

.method public i(Lcom/hyphenate/chat/EMMessage;)V
    .locals 4

    .prologue
    .line 272
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v1

    const-class v2, Lcom/muta/yanxi/emchat/ui/ContextMenuActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "message"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "ischatroom"

    iget v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->alL:I

    const/4 v3, 0x3

    if-ne v0, v3, :cond_0

    const/4 v0, 0x1

    .line 273
    :goto_0
    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0xe

    .line 272
    invoke-virtual {p0, v0, v1}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 275
    return-void

    .line 272
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected oC()V
    .locals 2

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/d;->F(Landroid/app/Activity;)Lybj366533/BasePopup/TranslucentBar/d;

    move-result-object v0

    const/4 v1, 0x1

    .line 78
    invoke-virtual {v0, v1}, Lybj366533/BasePopup/TranslucentBar/d;->aM(Z)Lybj366533/BasePopup/TranslucentBar/d;

    move-result-object v0

    .line 79
    invoke-virtual {v0}, Lybj366533/BasePopup/TranslucentBar/d;->init()V

    .line 80
    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/p;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->b(Landroid/view/Window;)V

    .line 81
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 141
    invoke-super {p0, p1, p2, p3}, Lcom/muta/yanxi/view/fragment/IMChatFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 142
    const/16 v0, 0xe

    if-ne p1, v0, :cond_0

    .line 143
    packed-switch p2, :pswitch_data_0

    .line 163
    :cond_0
    :goto_0
    const/4 v0, -0x1

    if-ne p2, v0, :cond_1

    .line 164
    packed-switch p1, :pswitch_data_1

    .line 200
    :cond_1
    :goto_1
    :pswitch_0
    return-void

    .line 145
    :pswitch_1
    iget-object v1, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->arj:Landroid/content/ClipboardManager;

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aro:Lcom/hyphenate/chat/EMMessage;

    .line 146
    invoke-virtual {v0}, Lcom/hyphenate/chat/EMMessage;->getBody()Lcom/hyphenate/chat/EMMessageBody;

    move-result-object v0

    check-cast v0, Lcom/hyphenate/chat/EMTextMessageBody;

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMTextMessageBody;->getMessage()Ljava/lang/String;

    move-result-object v0

    .line 145
    invoke-static {v2, v0}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    goto :goto_0

    .line 149
    :pswitch_2
    iget-object v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aau:Lcom/hyphenate/chat/EMConversation;

    iget-object v1, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aro:Lcom/hyphenate/chat/EMMessage;

    invoke-virtual {v1}, Lcom/hyphenate/chat/EMMessage;->getMsgId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hyphenate/chat/EMConversation;->removeMessage(Ljava/lang/String;)V

    .line 150
    iget-object v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->arg:Lcom/muta/yanxi/a/ah;

    iget-object v0, v0, Lcom/muta/yanxi/a/ah;->agi:Lcom/muta/yanxi/widget/ChatMessageList;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/ChatMessageList;->refresh()V

    goto :goto_0

    .line 154
    :pswitch_3
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->getActivity()Landroid/support/v4/app/p;

    move-result-object v1

    const-class v2, Lcom/muta/yanxi/emchat/ui/ForwardMessageActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 155
    const-string v1, "forward_msg_id"

    iget-object v2, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aro:Lcom/hyphenate/chat/EMMessage;

    invoke-virtual {v2}, Lcom/hyphenate/chat/EMMessage;->getMsgId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 156
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 166
    :pswitch_4
    if-eqz p3, :cond_1

    .line 167
    const-string v0, "dur"

    invoke-virtual {p3, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 168
    const-string v1, "path"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 169
    new-instance v2, Ljava/io/File;

    invoke-static {}, Lcom/hyphenate/util/PathUtil;->getInstance()Lcom/hyphenate/util/PathUtil;

    move-result-object v3

    invoke-virtual {v3}, Lcom/hyphenate/util/PathUtil;->getImagePath()Ljava/io/File;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "thvideo"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 171
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 172
    const/4 v4, 0x3

    invoke-static {v1, v4}, Landroid/media/ThumbnailUtils;->createVideoThumbnail(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 173
    sget-object v5, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v6, 0x64

    invoke-virtual {v4, v5, v6, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 174
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 175
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2, v0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->e(Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_1

    .line 176
    :catch_0
    move-exception v0

    .line 177
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 182
    :pswitch_5
    if-eqz p3, :cond_1

    .line 183
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    .line 184
    if-eqz v0, :cond_1

    .line 185
    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->j(Landroid/net/Uri;)V

    goto/16 :goto_1

    .line 190
    :pswitch_6
    if-eqz p3, :cond_1

    .line 191
    const-string v0, "username"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 192
    invoke-virtual {p0, v0, v3}, Lcom/muta/yanxi/view/fragment/ChatFragment;->f(Ljava/lang/String;Z)V

    goto/16 :goto_1

    .line 143
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 164
    :pswitch_data_1
    .packed-switch 0xb
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    .prologue
    .line 85
    invoke-super {p0, p1, p2, p3}, Lcom/muta/yanxi/view/fragment/IMChatFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected ox()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 90
    invoke-virtual {p0, p0}, Lcom/muta/yanxi/view/fragment/ChatFragment;->a(Lcom/muta/yanxi/view/fragment/IMChatFragment$a;)V

    .line 91
    iget v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->alL:I

    if-ne v0, v2, :cond_0

    .line 92
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nH()Ljava/util/Map;

    move-result-object v0

    .line 93
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aaw:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 94
    iput-boolean v2, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->aqX:Z

    .line 97
    :cond_0
    invoke-super {p0}, Lcom/muta/yanxi/view/fragment/IMChatFragment;->ox()V

    .line 98
    iget-object v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->arg:Lcom/muta/yanxi/a/ah;

    iget-object v0, v0, Lcom/muta/yanxi/a/ah;->agg:Lcom/muta/yanxi/widget/input_ui/ChatInputMenu;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/input_ui/ChatInputMenu;->getEmojiconMenu()Lcom/muta/yanxi/widget/input_ui/EmojiconMenuBase;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/widget/input_ui/EmojiconMenu;

    invoke-static {}, Lcom/muta/yanxi/emchat/a/a;->oJ()Lcom/muta/yanxi/entity/EmojiconGroupEntity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/widget/input_ui/EmojiconMenu;->a(Lcom/muta/yanxi/entity/EmojiconGroupEntity;)V

    .line 99
    iget v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->alL:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 100
    iget-object v0, p0, Lcom/muta/yanxi/view/fragment/ChatFragment;->arg:Lcom/muta/yanxi/a/ah;

    iget-object v0, v0, Lcom/muta/yanxi/a/ah;->agg:Lcom/muta/yanxi/widget/input_ui/ChatInputMenu;

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/input_ui/ChatInputMenu;->getPrimaryMenu()Lcom/muta/yanxi/widget/input_ui/ChatPrimaryMenuBase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/widget/input_ui/ChatPrimaryMenuBase;->getEditText()Landroid/widget/EditText;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/fragment/ChatFragment$1;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/fragment/ChatFragment$1;-><init>(Lcom/muta/yanxi/view/fragment/ChatFragment;)V

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 121
    :cond_1
    return-void
.end method

.method protected rC()V
    .locals 0

    .prologue
    .line 126
    invoke-super {p0}, Lcom/muta/yanxi/view/fragment/IMChatFragment;->rC()V

    .line 137
    return-void
.end method

.method public rD()Lcom/muta/yanxi/widget/chatrow/b;
    .locals 2

    .prologue
    .line 212
    new-instance v0, Lcom/muta/yanxi/view/fragment/ChatFragment$a;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/muta/yanxi/view/fragment/ChatFragment$a;-><init>(Lcom/muta/yanxi/view/fragment/ChatFragment;Lcom/muta/yanxi/view/fragment/ChatFragment$1;)V

    return-object v0
.end method

.method protected rE()V
    .locals 3

    .prologue
    .line 298
    .line 299
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-ge v0, v1, :cond_0

    .line 300
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 301
    const-string v1, "*/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 302
    const-string v1, "android.intent.category.OPENABLE"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 307
    :goto_0
    const/16 v1, 0xc

    invoke-virtual {p0, v0, v1}, Lcom/muta/yanxi/view/fragment/ChatFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 308
    return-void

    .line 305
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.PICK"

    sget-object v2, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    goto :goto_0
.end method
