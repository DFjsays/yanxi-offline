.class public Lcom/muta/yanxi/view/activity/MainActivity;
.super Lcom/muta/yanxi/base/b;
.source "SourceFile"


# instance fields
.field private Yo:Lcom/muta/yanxi/c/a/d;

.field public Yr:Lcom/muta/yanxi/c/b/c;

.field private Ys:Lcom/muta/yanxi/c/b/b;

.field private amH:I

.field public amI:Z

.field private amJ:Z

.field anf:Lcom/muta/yanxi/a/g;

.field ang:Lcom/muta/yanxi/view/a/d;

.field anh:Landroid/support/v4/app/t;

.field public ani:Lcom/muta/yanxi/b/b;

.field private anj:Lcom/muta/yanxi/view/c/a;

.field private ank:Z

.field private anl:Ljava/lang/String;

.field private anm:Lcom/google/gson/JsonObject;

.field private ann:Z

.field private ano:I

.field private anp:I

.field private anq:[Ljava/lang/String;

.field private anr:[Ljava/lang/String;

.field private ans:J

.field private ant:Landroid/app/AlertDialog$Builder;

.field private anu:Z

.field private anv:Z

.field private anw:Ljava/lang/Class;

.field oraDvType:I


# direct methods
.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 150
    invoke-direct {p0}, Lcom/muta/yanxi/base/b;-><init>()V

    .line 94
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getSupportFragmentManager()Landroid/support/v4/app/t;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anh:Landroid/support/v4/app/t;

    .line 104
    iput-boolean v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ank:Z

    .line 105
    const-string v0, "index"

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anl:Ljava/lang/String;

    .line 106
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anm:Lcom/google/gson/JsonObject;

    .line 108
    iput-boolean v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    .line 109
    const/4 v0, -0x1

    iput v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ano:I

    .line 110
    iput v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    .line 112
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "\u4f60\u597d\u3002\u4eb2\uff0c\u521d\u6b21\u89c1\u9762\u3002\u6211\u7684\u540d\u5b57\u53eb\u505a\"\u5ae3\u6c50\"(YanXi)\uff0c\u662fMUTA\u7b2c(zui)\u4e00(ke)\u4f4d(ai)\u7684\u6b4c\u59ec\u3002"

    aput-object v1, v0, v3

    const-string v1, "\u73b0\u5728\u6211\u5c06\u966a\u4f34\u4f60\u8eab\u8fb9\uff0c\u4e00\u8d77\u804a\u5929\u6e38\u73a9\u3002\u4eb2\u53ef\u4ee5\u900f\u8fc7\u4e0e\u6211\u4e92\u52a8\u6765\u589e\u52a0\u597d\u611f\uff0c\u4fc3\u6210\u4eb2\u5bc6\u5173\u7cfb\u3002\u4f46\u82e5\u662f\u65b9\u6cd5\u4e0d\u5bf9\uff0c\u6211\u4e5f\u4f1a\u4e0d\u5f00\u5fc3\u7684\u54e6\u3002"

    aput-object v1, v0, v4

    const-string v1, "\u800c\u4f60\u5c06\u6210\u4e3a\u6211\uff08\u5ae3\u6c50\uff09\u7684\u7ecf\u7eaa\u4eba\uff0c\u57f9\u80b2\u6211\u3001\u8c03\u6559\u6211\u3002\u6559\u4f1a\u6211\u66f4\u591a\u7684\u5bf9\u8bdd\uff0c\u8ba9\u6211\u60c5\u611f\u66f4\u52a0\u4e30\u5bcc\u3002\u5e76\u4e14\u589e\u52a0\u6211\u7684\u4eba\u6c14\u503c\u548c\u70ed\u95e8\u5ea6\u3002"

    aput-object v1, v0, v5

    const/4 v1, 0x3

    const-string v2, "\u53e6\u5916\u8fd9\u8fb9\u63d0\u4f9b\u4e86\u5f55\u97f3\u5ba4\u7684\u529f\u80fd\uff0c\u4f60\u53ef\u4ee5\u5229\u7528\u5f55\u97f3\u5ba4\u521b\u4f5c\u5c5e\u4e8e\u81ea\u5df1\u7684\u6b4c\u66f2\uff0c\u9001\u7ed9\u6211\u6216\u662f\u5206\u4eab\u5176\u4ed6\u670b\u53cb\u4eec\u3002"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "\u7136\u540e\u6211\u4eec\u900f\u8fc7\u7b80\u5355\u7684\u6559\u5b66\u770b\u4e00\u4e0b\u4e92\u52a8\u548c\u5f55\u97f3\u5ba4\u7684\u4f7f\u7528\u65b9\u6cd5\u5427"

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anq:[Ljava/lang/String;

    .line 118
    new-array v0, v5, [Ljava/lang/String;

    const-string v1, "\u90a3\u4e48\uff0c\u4ecb\u7ecd\u5b8c\u6bd5\uff01\u82e5\u8fd8\u662f\u4e0d\u6e05\u695a\uff0c\u53ef\u4ee5\u70b9\u51fb\u5230\u5934\u50cf\u91cc\u8fb9\u7684\u8bbe\u5b9a\uff0c\u5230\u5e2e\u52a9\u6559\u5b66\u518d\u89c2\u770b\u4e00\u6b21\u3002"

    aput-object v1, v0, v3

    const-string v1, "\u63a5\u4e0b\u6765\u7684\u65e5\u5b50\u91cc\uff0c\u6211\u4eec\u8981\u597d\u597d\u76f8\u5904\u5537 ^_^"

    aput-object v1, v0, v4

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anr:[Ljava/lang/String;

    .line 121
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ans:J

    .line 128
    iput-boolean v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amI:Z

    .line 131
    iput-boolean v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amJ:Z

    .line 136
    iput-boolean v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    .line 140
    iput-boolean v4, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anv:Z

    .line 141
    const-class v0, Lcom/muta/yanxi/service/GetuiPushService;

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anw:Ljava/lang/Class;

    .line 158
    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;)J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ans:J

    return-wide v0
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;J)J
    .locals 1

    .prologue
    .line 85
    iput-wide p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ans:J

    return-wide p1
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;Lcom/google/gson/JsonObject;)Lcom/google/gson/JsonObject;
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anm:Lcom/google/gson/JsonObject;

    return-object p1
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;I)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/activity/MainActivity;->dw(I)V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;IIII)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/muta/yanxi/view/activity/MainActivity;->k(IIII)V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;IIIILjava/lang/String;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct/range {p0 .. p5}, Lcom/muta/yanxi/view/activity/MainActivity;->d(IIIILjava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;Lcom/hyphenate/chat/EMMessage;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/activity/MainActivity;->f(Lcom/hyphenate/chat/EMMessage;)V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/activity/MainActivity;->bN(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;II)Z
    .locals 1

    .prologue
    .line 85
    invoke-direct {p0, p1, p2}, Lcom/muta/yanxi/view/activity/MainActivity;->ad(II)Z

    move-result v0

    return v0
.end method

.method static synthetic a(Lcom/muta/yanxi/view/activity/MainActivity;Z)Z
    .locals 0

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ank:Z

    return p1
.end method

.method private ad(II)Z
    .locals 10

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1216
    move v0, v1

    .line 1218
    :goto_0
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v3, Lcom/muta/yanxi/view/a/d;->apR:[F

    array-length v3, v3

    if-ge v0, v3, :cond_2

    .line 1219
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v3, Lcom/muta/yanxi/view/a/d;->apR:[F

    aget v3, v3, v0

    float-to-int v3, v3

    .line 1220
    if-gt p1, v3, :cond_0

    if-gt p2, v3, :cond_1

    :cond_0
    if-lt p1, v3, :cond_5

    if-ge p2, v3, :cond_5

    :cond_1
    move v1, v2

    :cond_2
    move v0, v2

    .line 1227
    :goto_1
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    const/16 v3, 0x14

    if-gt v0, v3, :cond_7

    .line 1228
    const-wide v4, -0x3f60c00000000000L    # -2000.0

    const-wide/high16 v6, 0x4000000000000000L    # 2.0

    int-to-double v8, v0

    invoke-static {v6, v7, v8, v9}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v6

    mul-double/2addr v4, v6

    double-to-int v3, v4

    .line 1229
    if-gt p1, v3, :cond_3

    if-gt p2, v3, :cond_4

    :cond_3
    if-lt p1, v3, :cond_6

    if-ge p2, v3, :cond_6

    .line 1235
    :cond_4
    :goto_2
    return v2

    .line 1218
    :cond_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1227
    :cond_6
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_7
    move v2, v1

    goto :goto_2
.end method

.method public static am(Landroid/content/Context;)Landroid/content/Intent;
    .locals 2

    .prologue
    .line 144
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/muta/yanxi/view/activity/MainActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 145
    invoke-static {v0}, Lcom/muta/yanxi/base/e;->o(Landroid/content/Intent;)Landroid/content/Intent;

    .line 146
    invoke-static {v0}, Lcom/muta/yanxi/base/e;->l(Landroid/content/Intent;)Landroid/content/Intent;

    .line 147
    return-object v0
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MainActivity;I)I
    .locals 0

    .prologue
    .line 85
    iput p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ano:I

    return p1
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MainActivity;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .prologue
    .line 85
    iput-object p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anl:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qD()V

    return-void
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MainActivity;IIIILjava/lang/String;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct/range {p0 .. p5}, Lcom/muta/yanxi/view/activity/MainActivity;->c(IIIILjava/lang/String;)V

    return-void
.end method

.method static synthetic b(Lcom/muta/yanxi/view/activity/MainActivity;Z)Z
    .locals 0

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    return p1
.end method

.method private bN(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 876
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    iget-boolean v0, v0, Lcom/muta/yanxi/view/a/d;->apU:Z

    if-eqz v0, :cond_0

    .line 878
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqD:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 879
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adg:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setVisibility(I)V

    .line 881
    :cond_0
    if-nez p1, :cond_1

    const-string v0, ""

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 882
    :cond_1
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/c;->py()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 883
    invoke-static {}, Lcom/muta/yanxi/b;->nL()Lcom/muta/yanxi/b;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/muta/yanxi/b;->aK(Ljava/lang/String;)V

    .line 885
    :cond_2
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adh:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 896
    :cond_3
    return-void
.end method

.method private bO(Ljava/lang/String;)I
    .locals 1

    .prologue
    .line 1131
    const-string v0, "conflict"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1132
    const v0, 0x7f0900bc

    .line 1138
    :goto_0
    return v0

    .line 1133
    :cond_0
    const-string v0, "account_removed"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1134
    const v0, 0x7f0900d9

    goto :goto_0

    .line 1135
    :cond_1
    const-string v0, "user_forbidden"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1136
    const v0, 0x7f09027c

    goto :goto_0

    .line 1138
    :cond_2
    const v0, 0x7f090056

    goto :goto_0
.end method

.method private bP(Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v2, 0x1

    .line 1146
    iput-boolean v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    .line 1147
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v2, v1}, Lcom/muta/yanxi/a;->logout(ZLcom/hyphenate/EMCallBack;)V

    .line 1148
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f090050

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 1149
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1152
    :try_start_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1153
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 1154
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/activity/MainActivity;->bO(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    .line 1155
    const v1, 0x7f09011d

    new-instance v2, Lcom/muta/yanxi/view/activity/MainActivity$26;

    invoke-direct {v2, p0}, Lcom/muta/yanxi/view/activity/MainActivity$26;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 1168
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    .line 1169
    instance-of v1, v0, Landroid/app/AlertDialog$Builder;

    if-nez v1, :cond_1

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1170
    :goto_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amI:Z

    .line 1175
    :cond_0
    :goto_1
    return-void

    .line 1169
    :cond_1
    check-cast v0, Landroid/app/AlertDialog$Builder;

    invoke-static {v0}, Lcom/growingio/android/sdk/agent/VdsAgent;->showAlertDialogBuilder(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 1171
    :catch_0
    move-exception v0

    .line 1172
    const-string v1, "MainActivity"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "---------color conflictBuilder error"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/hyphenate/util/EMLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method static synthetic c(Lcom/muta/yanxi/view/activity/MainActivity;I)I
    .locals 0

    .prologue
    .line 85
    iput p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    return p1
.end method

.method private c(IIIILjava/lang/String;)V
    .locals 6

    .prologue
    invoke-static/range {p0 .. p5}, Lcom/muta/yanxi/offline/OfflineConfession;->startLove(Landroid/app/Activity;IIIILjava/lang/String;)Z

    move-result v0

    return-void

    .line 1363
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/b/b;->show()V

    .line 1364
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1365
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$c;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 1366
    invoke-interface/range {v0 .. v5}, Lcom/muta/yanxi/presenter/a/d$c;->a(IIIILjava/lang/String;)Lrx/Observable;

    move-result-object v0

    .line 1367
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 1368
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 1369
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$29;

    invoke-direct {v1, p0, p0}, Lcom/muta/yanxi/view/activity/MainActivity$29;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;Landroid/content/Context;)V

    .line 1370
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 1417
    return-void
.end method

.method static synthetic c(Lcom/muta/yanxi/view/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qM()V

    return-void
.end method

.method static synthetic c(Lcom/muta/yanxi/view/activity/MainActivity;Z)Z
    .locals 0

    .prologue
    .line 85
    iput-boolean p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    return p1
.end method

.method private d(IIIILjava/lang/String;)V
    .locals 6

    .prologue
    invoke-static/range {p0 .. p5}, Lcom/muta/yanxi/offline/OfflineConfession;->startBreakup(Landroid/app/Activity;IIIILjava/lang/String;)Z

    move-result v0

    return-void

    .line 1428
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/b/b;->show()V

    .line 1429
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1430
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$c;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    .line 1431
    invoke-interface/range {v0 .. v5}, Lcom/muta/yanxi/presenter/a/d$c;->b(IIIILjava/lang/String;)Lrx/Observable;

    move-result-object v0

    .line 1432
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 1433
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 1434
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$30;

    invoke-direct {v1, p0, p0}, Lcom/muta/yanxi/view/activity/MainActivity$30;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;Landroid/content/Context;)V

    .line 1435
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 1482
    return-void
.end method

.method static synthetic d(Lcom/muta/yanxi/view/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->showDialog()V

    return-void
.end method

.method static synthetic d(Lcom/muta/yanxi/view/activity/MainActivity;I)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/activity/MainActivity;->dv(I)V

    return-void
.end method

.method private dv(I)V
    .locals 2

    .prologue
    iput p1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->oraDvType:I

    .line 819
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acW:Lsilicar/tutu/universal/widget/UniversalFrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalFrameLayout;->setVisibility(I)V

    .line 820
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acV:Lsilicar/tutu/universal/widget/UniversalFrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalFrameLayout;->setVisibility(I)V

    .line 821
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/b/b;->hz()Lcn/wittyneko/live2d/app/LAppView;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcn/wittyneko/live2d/app/LAppView;->setOnTouchEnable(Z)V

    .line 822
    new-instance v0, Lcom/muta/yanxi/view/b/a;

    invoke-direct {v0, p0, p1}, Lcom/muta/yanxi/view/b/a;-><init>(Landroid/content/Context;I)V

    .line 823
    invoke-virtual {v0}, Lcom/muta/yanxi/view/b/a;->show()V

    .line 824
    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$19;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$19;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/b/a;->a(Lcom/muta/yanxi/view/b/a$a;)V

    .line 853
    return-void
.end method

.method private dw(I)V
    .locals 2

    .prologue
    .line 1490
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1491
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1492
    invoke-interface {v0, p1}, Lcom/muta/yanxi/presenter/a/d$c;->dl(I)Lrx/Observable;

    move-result-object v0

    .line 1493
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 1494
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 1495
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$31;

    invoke-direct {v1, p0, p0}, Lcom/muta/yanxi/view/activity/MainActivity$31;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;Landroid/content/Context;)V

    .line 1496
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 1511
    return-void
.end method

.method static synthetic e(Lcom/muta/yanxi/view/activity/MainActivity;)Z
    .locals 1

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    return v0
.end method

.method static synthetic f(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/google/gson/JsonObject;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anm:Lcom/google/gson/JsonObject;

    return-object v0
.end method

.method private f(Lcom/hyphenate/chat/EMMessage;)V
    .locals 3

    .prologue
    .line 857
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    iget-boolean v0, v0, Lcom/muta/yanxi/view/a/d;->apU:Z

    if-eqz v0, :cond_0

    .line 859
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqD:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 860
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adg:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setVisibility(I)V

    .line 862
    :cond_0
    if-eqz p1, :cond_1

    .line 863
    invoke-virtual {p1}, Lcom/hyphenate/chat/EMMessage;->getBody()Lcom/hyphenate/chat/EMMessageBody;

    move-result-object v0

    check-cast v0, Lcom/hyphenate/chat/EMTextMessageBody;

    .line 864
    invoke-virtual {v0}, Lcom/hyphenate/chat/EMTextMessageBody;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/muta/yanxi/e/e;->a(Landroid/content/Context;Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 867
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v1, v1, Lcom/muta/yanxi/a/g;->adh:Landroid/widget/TextView;

    sget-object v2, Landroid/widget/TextView$BufferType;->SPANNABLE:Landroid/widget/TextView$BufferType;

    invoke-virtual {v1, v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;Landroid/widget/TextView$BufferType;)V

    .line 868
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v0

    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v1

    invoke-virtual {v1}, Lcom/muta/yanxi/a;->nG()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hyphenate/chat/EMChatManager;->getConversation(Ljava/lang/String;)Lcom/hyphenate/chat/EMConversation;

    move-result-object v0

    .line 869
    invoke-virtual {p1}, Lcom/hyphenate/chat/EMMessage;->getMsgId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/hyphenate/chat/EMConversation;->markMessageAsRead(Ljava/lang/String;)V

    .line 872
    :cond_1
    return-void
.end method

.method static synthetic g(Lcom/muta/yanxi/view/activity/MainActivity;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anl:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic h(Lcom/muta/yanxi/view/activity/MainActivity;)Z
    .locals 1

    .prologue
    .line 85
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ank:Z

    return v0
.end method

.method static synthetic i(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/c/b/b;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    return-object v0
.end method

.method static synthetic j(Lcom/muta/yanxi/view/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 85
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qN()V

    return-void
.end method

.method static synthetic k(Lcom/muta/yanxi/view/activity/MainActivity;)Ljava/lang/Class;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anw:Ljava/lang/Class;

    return-object v0
.end method

.method private k(IIII)V
    .locals 3

    .prologue
    .line 1274
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1275
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1276
    invoke-interface {v0, p1, p2, p3, p4}, Lcom/muta/yanxi/presenter/a/d$c;->j(IIII)Lrx/Observable;

    move-result-object v0

    .line 1277
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 1278
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 1279
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$27;

    .line 1280
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/muta/yanxi/view/activity/MainActivity$27;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 1305
    return-void
.end method

.method static synthetic l(Lcom/muta/yanxi/view/activity/MainActivity;)I
    .locals 1

    .prologue
    .line 85
    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amH:I

    return v0
.end method

.method static synthetic m(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/view/b/b;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    return-object v0
.end method

.method static synthetic n(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/view/b/b;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    return-object v0
.end method

.method static synthetic o(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/view/b/b;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    return-object v0
.end method

.method static synthetic p(Lcom/muta/yanxi/view/activity/MainActivity;)Lcom/muta/yanxi/view/b/b;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaS:Lcom/muta/yanxi/view/b/b;

    return-object v0
.end method

.method private p(Landroid/content/Intent;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1179
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    if-nez v0, :cond_1

    const-string v0, "conflict"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 1180
    const-string v0, "conflict"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->bP(Ljava/lang/String;)V

    .line 1186
    :cond_0
    :goto_0
    return-void

    .line 1181
    :cond_1
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    if-nez v0, :cond_2

    const-string v0, "account_removed"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1182
    const-string v0, "account_removed"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->bP(Ljava/lang/String;)V

    goto :goto_0

    .line 1183
    :cond_2
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    if-nez v0, :cond_0

    const-string v0, "user_forbidden"

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1184
    const-string v0, "user_forbidden"

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->bP(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private qD()V
    .locals 1

    .prologue
    .line 991
    new-instance v0, Lcom/muta/yanxi/view/activity/MainActivity$25;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/view/activity/MainActivity$25;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1003
    return-void
.end method

.method private qM()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 939
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acR:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 940
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acR:Landroid/view/View;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$22;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$22;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 946
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/b/b;->hz()Lcn/wittyneko/live2d/app/LAppView;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcn/wittyneko/live2d/app/LAppView;->setOnTouchEnable(Z)V

    .line 947
    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ano:I

    packed-switch v0, :pswitch_data_0

    .line 968
    :goto_0
    return-void

    .line 949
    :pswitch_0
    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anq:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 950
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anq:[Ljava/lang/String;

    iget v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->bN(Ljava/lang/String;)V

    .line 951
    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    goto :goto_0

    .line 954
    :cond_0
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/muta/yanxi/view/activity/NoviceGuideActivity;->g(Landroid/content/Context;Z)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 958
    :pswitch_1
    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anr:[Ljava/lang/String;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    .line 959
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anr:[Ljava/lang/String;

    iget v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->bN(Ljava/lang/String;)V

    .line 960
    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    goto :goto_0

    .line 963
    :cond_1
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qP()V

    .line 964
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qO()V

    goto :goto_0

    .line 947
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private qN()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1241
    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineStage;->migrate(Landroid/content/Context;)I

    move-result v0

    .line 1242
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    const-string v2, "sync_value"

    invoke-virtual {v1, v2, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-gez v1, :cond_3

    const/4 v1, 0x0

    :cond_3
    const/16 v5, 0x3e7

    if-le v1, v5, :cond_8

    move v1, v5

    .line 1243
    :cond_8
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    const-string v3, "sync_show_value"

    invoke-virtual {v2, v3, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v2

    .line 1244
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    const-string v4, "sync_cache_value"

    invoke-virtual {v3, v4, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v3

    .line 1245
    iget-object v4, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    const-string v5, "sync_score"

    invoke-virtual {v4, v5, v6}, Lcom/muta/yanxi/c/b/b;->getInt(Ljava/lang/String;I)I

    move-result v4

    .line 1246
    iget-object v5, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v5, v5, Lcom/muta/yanxi/a/g;->adk:Landroid/widget/TextView;

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1249
    if-nez v2, :cond_6

    .line 1250
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    add-int v4, v1, v3

    if-gez v4, :cond_4

    const/4 v4, 0x0

    :cond_4
    invoke-virtual {v2, v1, v4}, Lcom/muta/yanxi/view/a/d;->ae(II)V

    .line 1254
    :goto_0
    add-int/2addr v1, v3

    if-gez v1, :cond_5

    const/4 v1, 0x0

    .line 1255
    :cond_5
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    invoke-virtual {v2}, Lcom/muta/yanxi/c/b/b;->ps()Lcom/muta/yanxi/c/b/b$a;

    move-result-object v2

    const-string v3, "sync_show_value"

    .line 1256
    invoke-virtual {v2, v3, v1}, Lcom/muta/yanxi/c/b/b$a;->o(Ljava/lang/String;I)Lcom/muta/yanxi/c/b/d$a;

    move-result-object v1

    .line 1257
    invoke-virtual {v1}, Lcom/muta/yanxi/c/b/d$a;->commit()Z

    .line 1260
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-static {v0}, Lcom/muta/yanxi/offline/OfflineStage;->toLevel(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/muta/yanxi/b/b;->aS(Ljava/lang/String;)V

    .line 1261
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/view/a/d;->dA(I)V

    .line 1262
    return-void

    .line 1252
    :cond_6
    iget-object v4, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    add-int v5, v1, v3

    if-gez v5, :cond_7

    const/4 v5, 0x0

    :cond_7
    invoke-virtual {v4, v2, v5}, Lcom/muta/yanxi/view/a/d;->ae(II)V

    goto :goto_0
.end method

.method private qO()V
    .locals 3

    .prologue
    .line 1313
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1314
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$c;

    .line 1315
    invoke-interface {v0}, Lcom/muta/yanxi/presenter/a/d$c;->pL()Lrx/Observable;

    move-result-object v0

    .line 1316
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 1317
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 1318
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$28;

    .line 1319
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/muta/yanxi/view/activity/MainActivity$28;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 1351
    return-void
.end method

.method private qP()V
    .locals 2

    .prologue
    .line 1517
    invoke-static {}, Lcom/muta/yanxi/presenter/a/a;->pJ()Lretrofit2/Retrofit;

    move-result-object v0

    const-class v1, Lcom/muta/yanxi/presenter/a/d$g;

    .line 1518
    invoke-virtual {v0, v1}, Lretrofit2/Retrofit;->create(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/presenter/a/d$g;

    .line 1519
    invoke-interface {v0}, Lcom/muta/yanxi/presenter/a/d$g;->pS()Lrx/Observable;

    move-result-object v0

    .line 1520
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->tP()Lcom/trello/rxlifecycle/f;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->compose(Lrx/Observable$Transformer;)Lrx/Observable;

    move-result-object v0

    .line 1521
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->subscribeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    .line 1522
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lrx/Observable;->observeOn(Lrx/Scheduler;)Lrx/Observable;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$32;

    invoke-direct {v1, p0, p0}, Lcom/muta/yanxi/view/activity/MainActivity$32;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;Landroid/content/Context;)V

    .line 1523
    invoke-virtual {v0, v1}, Lrx/Observable;->subscribe(Lrx/Subscriber;)Lrx/Subscription;

    .line 1542
    return-void
.end method

.method private qr()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 973
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "android.permission.WRITE_EXTERNAL_STORAGE"

    aput-object v2, v0, v1

    const-string v1, "android.permission.READ_PHONE_STATE"

    aput-object v1, v0, v3

    const/4 v1, 0x2

    const-string v2, "android.permission.CAMERA"

    aput-object v2, v0, v1

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$24;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$24;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-static {p0, v3, v0, v1}, Lcom/muta/yanxi/e/c/b;->a(Landroid/content/Context;I[Ljava/lang/String;Lcom/muta/yanxi/e/c/b$a;)V

    .line 988
    return-void
.end method

.method private showDialog()V
    .locals 5

    .prologue
    :try_start_0
    const/4 v4, 0x0

    .line 901
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    const-string v1, "chat"

    invoke-static {v0, v1}, Lcom/muta/yanxi/b;->o(Landroid/content/Context;Ljava/lang/String;)V

    .line 902
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    iput-boolean v4, v0, Lcom/muta/yanxi/view/a/d;->apU:Z

    .line 903
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqD:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 904
    new-instance v0, Lcom/muta/yanxi/view/c/a;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/view/c/a;-><init>(Lcom/muta/yanxi/base/b;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    .line 906
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    const v1, 0x7f100110

    invoke-virtual {p0, v1}, Lcom/muta/yanxi/view/activity/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/16 v2, 0x51

    invoke-virtual {v0, v1, v2, v4, v4}, Lcom/muta/yanxi/view/c/a;->showAtLocation(Landroid/view/View;III)V

    .line 907
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$20;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$20;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/c/a;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 919
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$21;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$21;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/c/a;->a(Lcom/muta/yanxi/view/c/a$a;)V

    .line 933
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adg:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    invoke-static {v0}, Lcom/muta/yanxi/offline/OfflineChatBridge;->attach(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-nez v0, :cond_offline_attach

    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/c/a;->dismiss()V

    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineChatBridge;->fallback(Landroid/app/Activity;)V

    return-void

    :cond_offline_attach
    .line 934
    return-void

    :catch_0
    move-exception v4

    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineChatBridge;->fallback(Landroid/app/Activity;)V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    .prologue
    .line 343
    invoke-super {p0, p1, p2, p3}, Lcom/muta/yanxi/base/b;->onActivityResult(IILandroid/content/Intent;)V

    .line 344
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 345
    const/16 v0, 0xe9

    if-ne p1, v0, :cond_1

    .line 346
    if-eqz p3, :cond_0

    .line 347
    const-string v0, "SELECTED_PHOTOS"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 348
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/view/c/a;->m(Ljava/util/ArrayList;)V

    .line 354
    :cond_0
    :goto_0
    return-void

    .line 350
    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 351
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anj:Lcom/muta/yanxi/view/c/a;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/c/a;->sb()V

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 162
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onCreate(Landroid/os/Bundle;)V

    .line 163
    const v0, 0x7f04002d

    invoke-static {p0, v0}, Landroid/a/e;->b(Landroid/app/Activity;I)Landroid/a/g;

    move-result-object v0

    check-cast v0, Lcom/muta/yanxi/a/g;

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    .line 164
    new-instance v0, Lcom/muta/yanxi/view/a/d;

    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/muta/yanxi/view/a/d;-><init>(Lcom/muta/yanxi/a/g;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    .line 165
    iput-boolean v4, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anv:Z

    .line 166
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oy()V

    .line 169
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_0

    .line 170
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getPackageName()Ljava/lang/String;

    .line 178
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qr()V

    .line 185
    :goto_0
    if-eqz p1, :cond_1

    const-string v0, "account_removed"

    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 186
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v4, v1}, Lcom/muta/yanxi/a;->logout(ZLcom/hyphenate/EMCallBack;)V

    .line 187
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qH()V

    .line 207
    :goto_1
    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineGreeting;->maybeGreet(Landroid/app/Activity;)V

    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineNGuide;->maybeShow(Landroid/app/Activity;)V

    return-void

    .line 180
    :cond_0
    invoke-static {}, Lcom/igexin/sdk/PushManager;->getInstance()Lcom/igexin/sdk/PushManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anw:Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Lcom/igexin/sdk/PushManager;->initialize(Landroid/content/Context;Ljava/lang/Class;)V

    goto :goto_0

    .line 189
    :cond_1
    if-eqz p1, :cond_2

    const-string v0, "isConflict"

    invoke-virtual {p1, v0, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 190
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qH()V

    goto :goto_1

    .line 197
    :cond_2
    invoke-static {}, Lcom/igexin/sdk/PushManager;->getInstance()Lcom/igexin/sdk/PushManager;

    move-result-object v0

    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/muta/yanxi/service/GetuiIntentService;

    invoke-virtual {v0, v1, v2}, Lcom/igexin/sdk/PushManager;->registerPushIntentService(Landroid/content/Context;Ljava/lang/Class;)V

    .line 203
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->p(Landroid/content/Intent;)V

    .line 205
    new-instance v0, Lcom/muta/yanxi/c/a/d;

    invoke-direct {v0, p0}, Lcom/muta/yanxi/c/a/d;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yo:Lcom/muta/yanxi/c/a/d;

    goto :goto_1
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 312
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onDestroy()V

    .line 314
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/b/b;->release()V

    .line 316
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ant:Landroid/app/AlertDialog$Builder;

    if-eqz v0, :cond_0

    .line 317
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ant:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->dismiss()V

    .line 318
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ant:Landroid/app/AlertDialog$Builder;

    .line 319
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anu:Z

    .line 323
    :cond_0
    return-void
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .locals 1

    .prologue
    .line 338
    invoke-super {p0, p1, p2}, Lcom/muta/yanxi/base/b;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 3
    .annotation build Lcom/growingio/android/sdk/instrumentation/Instrumented;
    .end annotation

    .prologue
    invoke-static {p0, p1}, Lcom/growingio/android/sdk/agent/VdsAgent;->onNewIntent(Ljava/lang/Object;Landroid/content/Intent;)V

    .line 211
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onNewIntent(Landroid/content/Intent;)V

    .line 212
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/c/b/a;->Y(Landroid/content/Context;)Lcom/muta/yanxi/c/b/a;

    move-result-object v0

    const-string v1, "login_isNewUser"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    .line 214
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/a/d;->rx()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 215
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqC:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 217
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqE:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 218
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adg:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setVisibility(I)V

    .line 219
    invoke-direct {p0, p1}, Lcom/muta/yanxi/view/activity/MainActivity;->p(Landroid/content/Intent;)V

    .line 221
    const-string v0, "MainActivity"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 222
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "logout"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 223
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qH()V

    .line 225
    :cond_1
    return-void
.end method

.method protected onPause()V
    .locals 1

    .prologue
    .line 297
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/b/b;->onPause()V

    .line 298
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onPause()V

    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineMemories;->pause(Landroid/content/Context;)V

    .line 299
    return-void
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 0

    .prologue
    .line 359
    invoke-static {p1, p2, p3}, Lcom/muta/yanxi/e/c/b;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 360
    invoke-super {p0, p1, p2, p3}, Lcom/muta/yanxi/base/b;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 361
    return-void
.end method

.method protected onResume()V
    .locals 7

    .prologue
    const v6, 0x7f020183

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 252
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onResume()V

    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineMemories;->resume(Landroid/content/Context;)V

    .line 254
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    invoke-virtual {v0, v4}, Lcom/muta/yanxi/c/b/c;->ax(Z)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 255
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/b/b;->pl()V

    .line 256
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/c;->pz()Lcom/muta/yanxi/c/b/c$a;

    move-result-object v0

    const-string v1, "update_preferences"

    .line 257
    invoke-virtual {v0, v1, v4}, Lcom/muta/yanxi/c/b/c$a;->d(Ljava/lang/String;Z)Lcom/muta/yanxi/c/b/d$a;

    move-result-object v0

    .line 258
    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/d$a;->commit()Z

    .line 260
    :cond_0
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nz()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 261
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    if-nez v0, :cond_1

    .line 262
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qO()V

    .line 264
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/muta/yanxi/service/HeartbeatService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 267
    :cond_2
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    const-string v1, "user"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/c;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 268
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    const-string v1, "Headimg"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/c;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 269
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    const-string v2, "Realname"

    const-string v3, ""

    invoke-virtual {v1, v2, v3}, Lcom/muta/yanxi/c/b/c;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 270
    const-string v2, ""

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 271
    invoke-static {p0}, Lcom/bumptech/glide/g;->a(Landroid/support/v4/app/p;)Lcom/bumptech/glide/j;

    move-result-object v0

    const v2, 0x7f0201a2

    .line 272
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/bumptech/glide/j;->b(Ljava/lang/Integer;)Lcom/bumptech/glide/d;

    move-result-object v0

    new-array v2, v5, [Lcom/bumptech/glide/load/resource/bitmap/d;

    new-instance v3, Lcom/muta/yanxi/e/b/b;

    invoke-direct {v3, p0, v6}, Lcom/muta/yanxi/e/b/b;-><init>(Landroid/content/Context;I)V

    aput-object v3, v2, v4

    .line 273
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/d;->b([Lcom/bumptech/glide/load/resource/bitmap/d;)Lcom/bumptech/glide/c;

    move-result-object v0

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->acP:Landroid/widget/ImageView;

    .line 274
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/c;->c(Landroid/widget/ImageView;)Lcom/bumptech/glide/f/b/j;

    .line 282
    :goto_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adf:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 283
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qN()V

    .line 284
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/b/b;->onResume()V

    .line 289
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    .line 290
    invoke-virtual {v0, p0}, Lcom/muta/yanxi/a;->y(Landroid/app/Activity;)V

    .line 293
    return-void

    .line 276
    :cond_3
    invoke-static {p0}, Lcom/bumptech/glide/g;->a(Landroid/support/v4/app/p;)Lcom/bumptech/glide/j;

    move-result-object v2

    .line 277
    invoke-static {v0}, Lcom/muta/yanxi/e/i;->bw(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/bumptech/glide/j;->ax(Ljava/lang/String;)Lcom/bumptech/glide/d;

    move-result-object v0

    new-array v2, v5, [Lcom/bumptech/glide/load/resource/bitmap/d;

    new-instance v3, Lcom/muta/yanxi/e/b/b;

    invoke-direct {v3, p0, v6}, Lcom/muta/yanxi/e/b/b;-><init>(Landroid/content/Context;I)V

    aput-object v3, v2, v4

    .line 278
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/d;->b([Lcom/bumptech/glide/load/resource/bitmap/d;)Lcom/bumptech/glide/c;

    move-result-object v0

    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->acP:Landroid/widget/ImageView;

    .line 279
    invoke-virtual {v0, v2}, Lcom/bumptech/glide/c;->c(Landroid/widget/ImageView;)Lcom/bumptech/glide/f/b/j;

    goto :goto_0
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    .prologue
    .line 327
    const-string v0, "isConflict"

    iget-boolean v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amI:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 328
    const-string v0, "account_removed"

    iget-boolean v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amJ:Z

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 329
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 330
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 304
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    .line 305
    invoke-virtual {v0, p0}, Lcom/muta/yanxi/a;->z(Landroid/app/Activity;)V

    .line 307
    invoke-super {p0}, Lcom/muta/yanxi/base/b;->onStop()V

    .line 308
    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 229
    invoke-super {p0, p1}, Lcom/muta/yanxi/base/b;->onWindowFocusChanged(Z)V

    .line 231
    if-eqz p1, :cond_1

    .line 232
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-static {v0}, Lybj366533/BasePopup/TranslucentBar/e;->c(Landroid/view/Window;)V

    .line 233
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/a/d;->rk()V

    .line 234
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amI:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->amJ:Z

    if-nez v0, :cond_0

    .line 235
    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    if-nez v0, :cond_0

    .line 236
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qE()V

    .line 241
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/c;->py()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ano:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    .line 242
    iput v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ano:I

    .line 243
    iput v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anp:I

    .line 244
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acQ:Lsilicar/tutu/universal/widget/UniversalLinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalLinearLayout;->setVisibility(I)V

    .line 245
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qM()V

    .line 248
    :cond_1
    return-void
.end method

.method protected oo()V
    .locals 3

    .prologue
    .line 365
    const-string v0, "live2d"

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->aaT:Ljava/lang/String;

    .line 367
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/c/b/c;->aa(Landroid/content/Context;)Lcom/muta/yanxi/c/b/c;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    .line 368
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/c/b/b;->Z(Landroid/content/Context;)Lcom/muta/yanxi/c/b/b;

    move-result-object v0

    iput-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    .line 370
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->oz()Lcom/muta/yanxi/base/b;

    move-result-object v0

    invoke-static {v0}, Lcom/muta/yanxi/c/b/a;->Y(Landroid/content/Context;)Lcom/muta/yanxi/c/b/a;

    move-result-object v0

    const-string v1, "login_isNewUser"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/a;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ann:Z

    .line 371
    return-void
.end method

.method protected ov()V
    .locals 0

    .prologue
    .line 378
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qK()V

    .line 380
    return-void
.end method

.method protected ow()V
    .locals 4

    .prologue
    .line 386
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ans:J

    .line 387
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 388
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "user_hear_in"

    .line 389
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$1;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$1;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 390
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 404
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 407
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 408
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "message_info"

    .line 409
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$12;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$12;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 410
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 416
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 419
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "novice_guide_finish"

    .line 420
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 421
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$23;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$23;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 422
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 431
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 433
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adl:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$33;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$33;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 440
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acZ:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$34;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$34;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 447
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->ade:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$35;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$35;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 459
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->ads:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$36;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$36;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 470
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acH:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$37;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$37;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 483
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acI:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$38;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$38;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 497
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acJ:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$2;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 515
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adh:Landroid/widget/TextView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$3;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$3;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 530
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acQ:Lsilicar/tutu/universal/widget/UniversalLinearLayout;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$4;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$4;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalLinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 541
    const/4 v0, 0x3

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    .line 542
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    .line 543
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->adh:Landroid/widget/TextView;

    new-instance v3, Lcom/muta/yanxi/view/activity/MainActivity$5;

    invoke-direct {v3, p0, v0, v1}, Lcom/muta/yanxi/view/activity/MainActivity$5;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;[FI)V

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 575
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acP:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$6;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$6;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 587
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acM:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$7;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$7;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 596
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acN:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$8;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$8;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 605
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->acO:Landroid/widget/ImageView;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$9;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$9;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 614
    return-void

    .line 541
    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
    .end array-data
.end method

.method protected ox()V
    .locals 0

    .prologue
    .line 619
    return-void
.end method

.method public qE()V
    .locals 9

    .prologue
    return-void

    const/16 v8, 0x64

    const/4 v7, 0x4

    const/4 v1, 0x0

    .line 1011
    const-string v0, ""

    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v2

    invoke-virtual {v2}, Lcom/muta/yanxi/a;->nG()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1012
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v0

    invoke-virtual {v0}, Lcom/muta/yanxi/a;->nI()V

    .line 1015
    :cond_0
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/hyphenate/chat/EMChatManager;->getUnreadMsgsCount()I

    move-result v0

    .line 1017
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qF()I

    move-result v2

    .line 1020
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v3

    invoke-virtual {v3}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v3

    const-string v4, "0000-0000-0000"

    invoke-virtual {v3, v4}, Lcom/hyphenate/chat/EMChatManager;->getConversation(Ljava/lang/String;)Lcom/hyphenate/chat/EMConversation;

    move-result-object v3

    .line 1022
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v4

    invoke-virtual {v4}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v4

    const-string v5, "admin"

    invoke-virtual {v4, v5}, Lcom/hyphenate/chat/EMChatManager;->getConversation(Ljava/lang/String;)Lcom/hyphenate/chat/EMConversation;

    move-result-object v4

    .line 1023
    invoke-static {}, Lcom/muta/yanxi/a;->ns()Lcom/muta/yanxi/a;

    move-result-object v5

    invoke-virtual {v5}, Lcom/muta/yanxi/a;->nG()Ljava/lang/String;

    move-result-object v5

    .line 1024
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v6

    invoke-virtual {v6}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/hyphenate/chat/EMChatManager;->getConversation(Ljava/lang/String;)Lcom/hyphenate/chat/EMConversation;

    move-result-object v5

    .line 1025
    if-eqz v3, :cond_1

    .line 1032
    :cond_1
    if-eqz v4, :cond_2

    .line 1033
    invoke-virtual {v4}, Lcom/hyphenate/chat/EMConversation;->getUnreadMsgCount()I

    move-result v3

    sub-int/2addr v0, v3

    .line 1034
    invoke-virtual {v4}, Lcom/hyphenate/chat/EMConversation;->getUnreadMsgCount()I

    move-result v3

    sub-int/2addr v2, v3

    .line 1035
    invoke-virtual {v4}, Lcom/hyphenate/chat/EMConversation;->markAllMessagesAsRead()V

    :cond_2
    move v3, v0

    .line 1038
    if-eqz v5, :cond_9

    .line 1039
    invoke-virtual {v5}, Lcom/hyphenate/chat/EMConversation;->getUnreadMsgCount()I

    move-result v0

    if-eqz v0, :cond_3

    .line 1040
    invoke-virtual {v5}, Lcom/hyphenate/chat/EMConversation;->getLastMessage()Lcom/hyphenate/chat/EMMessage;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/muta/yanxi/view/activity/MainActivity;->f(Lcom/hyphenate/chat/EMMessage;)V

    .line 1041
    :cond_3
    invoke-virtual {v5}, Lcom/hyphenate/chat/EMConversation;->getUnreadMsgCount()I

    move-result v0

    .line 1043
    invoke-virtual {v5}, Lcom/hyphenate/chat/EMConversation;->getUnreadMsgCount()I

    move-result v4

    sub-int/2addr v2, v4

    .line 1049
    :goto_0
    if-lez v3, :cond_4

    .line 1050
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v3, v3, Lcom/muta/yanxi/a/g;->acX:Landroid/widget/TextView;

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1054
    :goto_1
    if-lez v2, :cond_6

    .line 1055
    if-ge v2, v8, :cond_5

    .line 1056
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v3, v3, Lcom/muta/yanxi/a/g;->adr:Landroid/widget/TextView;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1060
    :goto_2
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->adr:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1064
    :goto_3
    if-lez v0, :cond_8

    .line 1066
    if-ge v0, v8, :cond_7

    .line 1067
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->adc:Landroid/widget/TextView;

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1071
    :goto_4
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adc:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1075
    :goto_5
    return-void

    .line 1052
    :cond_4
    iget-object v3, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v3, v3, Lcom/muta/yanxi/a/g;->acX:Landroid/widget/TextView;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1

    .line 1058
    :cond_5
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->adr:Landroid/widget/TextView;

    const-string v3, "..."

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_2

    .line 1062
    :cond_6
    iget-object v2, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v2, v2, Lcom/muta/yanxi/a/g;->adr:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3

    .line 1069
    :cond_7
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adc:Landroid/widget/TextView;

    const-string v2, "..."

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_4

    .line 1073
    :cond_8
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adc:Landroid/widget/TextView;

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_5

    :cond_9
    move v0, v1

    goto :goto_0
.end method

.method public qF()I
    .locals 6

    .prologue
    const/4 v0, 0x0

    return v0

    .line 1112
    .line 1113
    const/4 v0, 0x0

    .line 1114
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hyphenate/chat/EMChatManager;->getUnreadMsgsCount()I

    move-result v2

    .line 1115
    invoke-static {}, Lcom/hyphenate/chat/EMClient;->getInstance()Lcom/hyphenate/chat/EMClient;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hyphenate/chat/EMClient;->chatManager()Lcom/hyphenate/chat/EMChatManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/hyphenate/chat/EMChatManager;->getAllConversations()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v0

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/hyphenate/chat/EMConversation;

    .line 1116
    invoke-virtual {v0}, Lcom/hyphenate/chat/EMConversation;->getType()Lcom/hyphenate/chat/EMConversation$EMConversationType;

    move-result-object v4

    sget-object v5, Lcom/hyphenate/chat/EMConversation$EMConversationType;->ChatRoom:Lcom/hyphenate/chat/EMConversation$EMConversationType;

    if-ne v4, v5, :cond_1

    .line 1117
    invoke-virtual {v0}, Lcom/hyphenate/chat/EMConversation;->getUnreadMsgCount()I

    move-result v0

    add-int/2addr v0, v1

    :goto_1
    move v1, v0

    .line 1118
    goto :goto_0

    .line 1119
    :cond_0
    return v2

    :cond_1
    move v0, v1

    goto :goto_1
.end method

.method public qH()V
    .locals 3

    .prologue
    .line 1191
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    invoke-virtual {v0}, Lcom/muta/yanxi/view/a/d;->rx()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1192
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqC:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 1194
    :cond_0
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ang:Lcom/muta/yanxi/view/a/d;

    sget-object v1, Lcom/muta/yanxi/view/a/d$a;->aqE:Lcom/muta/yanxi/view/a/d$a;

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/view/a/d;->a(Lcom/muta/yanxi/view/a/d$a;)Z

    .line 1195
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v0, v0, Lcom/muta/yanxi/a/g;->adg:Lsilicar/tutu/universal/widget/UniversalRelativeLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lsilicar/tutu/universal/widget/UniversalRelativeLayout;->setVisibility(I)V

    .line 1197
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Yr:Lcom/muta/yanxi/c/b/c;

    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/c;->pz()Lcom/muta/yanxi/c/b/c$a;

    move-result-object v0

    .line 1198
    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/c$a;->pA()Lcom/muta/yanxi/c/b/c$a;

    move-result-object v0

    .line 1199
    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/c$a;->pB()Lcom/muta/yanxi/c/b/c$a;

    move-result-object v0

    const-string v1, "isLogin"

    const-string v2, "0"

    .line 1200
    invoke-virtual {v0, v1, v2}, Lcom/muta/yanxi/c/b/c$a;->l(Ljava/lang/String;Ljava/lang/String;)Lcom/muta/yanxi/c/b/d$a;

    move-result-object v0

    .line 1201
    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/d$a;->commit()Z

    .line 1202
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->Ys:Lcom/muta/yanxi/c/b/b;

    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/b;->ps()Lcom/muta/yanxi/c/b/b$a;

    move-result-object v0

    .line 1203
    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/b$a;->pC()Lcom/muta/yanxi/c/b/d$a;

    move-result-object v0

    .line 1204
    invoke-virtual {v0}, Lcom/muta/yanxi/c/b/d$a;->commit()Z

    .line 1206
    const-string v0, "\u5355\u673a\u7248\uff1a\u8be5\u529f\u80fd\u9700\u8981\u8054\u7f51\uff0c\u5df2\u4e0d\u53ef\u7528"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1207
    return-void
.end method

.method protected qK()V
    .locals 5

    .prologue
    const/4 v4, -0x2

    .line 625
    invoke-static {p0}, Lcom/muta/yanxi/offline/OfflineStage;->migrate(Landroid/content/Context;)I

    move-result v0

    .line 627
    new-instance v1, Lcom/muta/yanxi/b/b;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/b/b;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    .line 628
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    const-string v2, "live2d/yanxi1/yanxi.model.json"

    invoke-virtual {v1, v2}, Lcom/muta/yanxi/b/b;->Q(Ljava/lang/String;)V

    .line 629
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    const-string v2, "image/bg_img.jpg"

    invoke-virtual {v1, v2}, Lcom/muta/yanxi/b/b;->R(Ljava/lang/String;)V

    .line 630
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-static {v0}, Lcom/muta/yanxi/offline/OfflineStage;->toLevel(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/muta/yanxi/b/b;->aS(Ljava/lang/String;)V

    .line 632
    invoke-direct {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qN()V

    .line 633
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    invoke-virtual {v0, p0}, Lcom/muta/yanxi/b/b;->r(Landroid/app/Activity;)Lcn/wittyneko/live2d/app/LAppView;

    move-result-object v0

    .line 634
    iget-object v1, p0, Lcom/muta/yanxi/view/activity/MainActivity;->anf:Lcom/muta/yanxi/a/g;

    iget-object v1, v1, Lcom/muta/yanxi/a/g;->acS:Landroid/widget/FrameLayout;

    const/4 v2, 0x0

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 636
    invoke-virtual {p0}, Lcom/muta/yanxi/view/activity/MainActivity;->qL()V

    .line 638
    return-void
.end method

.method public qL()V
    .locals 2

    .prologue
    .line 645
    iget-object v0, p0, Lcom/muta/yanxi/view/activity/MainActivity;->ani:Lcom/muta/yanxi/b/b;

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$10;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$10;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/muta/yanxi/b/b;->a(Lcom/muta/yanxi/b/a$b;)V

    .line 673
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "live2d_show_mini_dialog"

    .line 674
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 675
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$11;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$11;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 676
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 686
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 687
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 688
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "message_ai_info"

    .line 689
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$13;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$13;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 690
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 697
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 700
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "live2d_update_value"

    .line 701
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 702
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$14;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$14;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 703
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 749
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 752
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 753
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "live2d_time_start"

    .line 754
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$15;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$15;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 755
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 765
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 767
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 768
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "live2d_time_now"

    .line 769
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$16;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$16;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 770
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 782
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 784
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 785
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "live2d_time_end"

    .line 786
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$17;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$17;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 787
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 798
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 800
    invoke-static {}, Lcn/wittyneko/b/g;->im()Lcn/wittyneko/b/g;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcn/wittyneko/b/g;->a(Lcom/trello/rxlifecycle/b;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 801
    invoke-static {}, Lrx/android/schedulers/AndroidSchedulers;->mainThread()Lrx/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/Scheduler;)Lcn/wittyneko/b/f;

    move-result-object v0

    const-string v1, "muta_user_tuning"

    .line 802
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->ac(Ljava/lang/String;)Lcn/wittyneko/b/f;

    move-result-object v0

    new-instance v1, Lcom/muta/yanxi/view/activity/MainActivity$18;

    invoke-direct {v1, p0}, Lcom/muta/yanxi/view/activity/MainActivity$18;-><init>(Lcom/muta/yanxi/view/activity/MainActivity;)V

    .line 803
    invoke-virtual {v0, v1}, Lcn/wittyneko/b/f;->a(Lrx/functions/Action1;)Lcn/wittyneko/b/f;

    move-result-object v0

    .line 811
    invoke-virtual {v0}, Lcn/wittyneko/b/f;->create()V

    .line 812
    return-void
.end method
