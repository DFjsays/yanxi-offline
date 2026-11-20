.class Lcom/muta/yanxi/view/c/a$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/muta/yanxi/widget/ai_widget/input_menu/AIInputMenu$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/muta/yanxi/view/c/a;->ov()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic asA:Lcom/muta/yanxi/view/c/a;


# direct methods
.method constructor <init>(Lcom/muta/yanxi/view/c/a;)V
    .locals 0

    .prologue
    .line 202
    iput-object p1, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public ch(Ljava/lang/String;)V
    .locals 3

    .prologue
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0, p1}, Lcom/muta/yanxi/offline/OfflineChatBridge;->onInput(Ljava/lang/Object;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :offline_chat_continue

    return-void

    :offline_chat_continue
    .line 206
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0}, Lcom/muta/yanxi/view/c/a;->b(Lcom/muta/yanxi/view/c/a;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 207
    const-string v0, ""

    iget-object v1, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v1}, Lcom/muta/yanxi/view/c/a;->c(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/entity/AiDebugMessage;

    move-result-object v1

    invoke-virtual {v1}, Lcom/muta/yanxi/entity/AiDebugMessage;->getContent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0}, Lcom/muta/yanxi/view/c/a;->c(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/entity/AiDebugMessage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/entity/AiDebugMessage;->getContent()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 208
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0, p1}, Lcom/muta/yanxi/view/c/a;->a(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)Ljava/lang/String;

    .line 209
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0}, Lcom/muta/yanxi/view/c/a;->c(Lcom/muta/yanxi/view/c/a;)Lcom/muta/yanxi/entity/AiDebugMessage;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/muta/yanxi/entity/AiDebugMessage;->setContent(Ljava/lang/String;)V

    .line 210
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0, p1}, Lcom/muta/yanxi/view/c/a;->b(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V

    .line 211
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u95ee\u9898 = \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v2}, Lcom/muta/yanxi/view/c/a;->d(Lcom/muta/yanxi/view/c/a;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\", \u8bf7\u8f93\u5165\u56de\u5e94"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/muta/yanxi/view/c/a;->c(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V

    .line 225
    :goto_0
    return-void

    .line 213
    :cond_1
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0, p1}, Lcom/muta/yanxi/view/c/a;->d(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V

    goto :goto_0

    .line 217
    :cond_2
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0, p1}, Lcom/muta/yanxi/view/c/a;->e(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V

    .line 218
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0, p1}, Lcom/muta/yanxi/view/c/a;->a(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0
.end method

.method public sc()V
    .locals 0

    .prologue
    .line 235
    return-void
.end method

.method public sd()V
    .locals 2

    .prologue
    .line 240
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/muta/yanxi/view/c/a;->a(Lcom/muta/yanxi/view/c/a;Z)Z

    .line 241
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0}, Lcom/muta/yanxi/view/c/a;->e(Lcom/muta/yanxi/view/c/a;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 242
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0}, Lcom/muta/yanxi/view/c/a;->f(Lcom/muta/yanxi/view/c/a;)V

    .line 246
    :goto_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/c/a;->rC()V

    .line 248
    return-void

    .line 244
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    const-string v1, "\u8c03\u6559\u6a21\u5f0f\u5173\u95ed..."

    invoke-static {v0, v1}, Lcom/muta/yanxi/view/c/a;->c(Lcom/muta/yanxi/view/c/a;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public se()V
    .locals 2

    .prologue
    .line 253
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/muta/yanxi/view/c/a;->a(Lcom/muta/yanxi/view/c/a;Z)Z

    .line 255
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/c/a;->rW()V

    .line 256
    iget-object v0, p0, Lcom/muta/yanxi/view/c/a$2;->asA:Lcom/muta/yanxi/view/c/a;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/c/a;->rY()V

    .line 258
    return-void
.end method
