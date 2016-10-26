#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QTextStream>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    QTextStream cout(stdout);
    QObject *root=NULL;
    QList<QObject*> rootObjects = engine.rootObjects ();

    return app.exec();
}


