.class Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;->sG()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic awd:Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;


# direct methods
.method constructor <init>(Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;)V
    .locals 0

    .prologue
    .line 58
    iput-object p1, p0, Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet$1;->awd:Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation build Lcom/growingio/android/sdk/instrumentation/Instrumented;
    .end annotation

    .prologue
    invoke-static {p0, p1}, Lcom/growingio/android/sdk/agent/VdsAgent;->onClick(Ljava/lang/Object;Landroid/view/View;)V

    .line 61
    iget-object v0, p0, Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet$1;->awd:Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;

    iget-object v0, v0, Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet$1;->awd:Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;

    iget-object v1, v1, Lcom/muta/yanxi/widget/chatrow/EaseChatRowGreet;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/muta/yanxi/offline/OfflineProfileActivity;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    return-void
.end method
