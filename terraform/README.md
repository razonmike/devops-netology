Локальные каталоги .terraform

файлы .tfstate

Файлы журнала сбоев

Исключить все файлы .tfvars, которые могут содержать конфиденциальные данные, такие как
пароль, закрытые ключи и другие секреты. Они не должны быть частью версии
контролировать, поскольку они являются точками данных, которые потенциально конфиденциальны и подвержены
изменяться в зависимости от окружения.

Игнорировать файлы переопределения, так как они обычно используются для локального переопределения ресурсов и т.д.

Включите файлы переопределения, которые вы хотите добавить в систему контроля версий, используя инвертированный шаблон

Включите файлы tfplan, чтобы игнорировать вывод плана команды: terraform plan -out=tfplan

Игнорировать файлы конфигурации CLI
