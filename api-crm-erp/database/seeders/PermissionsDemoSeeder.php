<?php

namespace Database\Seeders;

use App\Models\User; 

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class PermissionsDemoSeeder extends Seeder
{
    /**
    
     *
     * @return void
     */
    public function run()
    {
        // Reset cached roles and permissions
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

      
        $sidebarPermissions = [
            // Roles
            'register_role', 'edit_role', 'delete_role',
            // Usuarios
            'register_user', 'edit_user', 'delete_user',
            // Productos
            'register_product', 'list_product', 'edit_product', 'delete_product',
            // Producto Wallet Price 
            'show_wallet_price_product', 'register_wallet_price_product', 'edit_wallet_price_product', 'delete_wallet_price_product',
            // Clientes
            'register_clientes', 'edit_clientes', 'delete_clientes',
            // Caja 
            'valid_payments', 'reports_caja', 'record_contract_process', 'egreso', 'ingreso', 'close_caja',
            // Proforma
            'register_proforma', 'list_proforma', 'edit_proforma', 'delete_proforma',
            // Cronograma
            'cronograma',
            // Comisiones (
            'comisiones',
            // Compras 
            'register_compra', 'edit_compra', 'delete_compra',
            // Transporte
            'register_transporte', 'edit_transporte', 'delete_transporte',
            // Despacho, Movimientos, Kardex 
            'despacho', 'movimientos', 'kardex',
          
            'list_proforma',
        ];

       
        $uniquePermissions = array_unique($sidebarPermissions);

  
        foreach ($uniquePermissions as $permissionName) {
          
            if (!Permission::where('name', $permissionName)->where('guard_name', 'api')->exists()) {
                Permission::create(['guard_name' => 'api', 'name' => $permissionName]);
            }
        }

      

       
        $role3 = Role::firstOrCreate(['guard_name' => 'api', 'name' => 'Super-Admin']);
       

      
        $user = User::firstOrCreate(
            ['email' => 'super_admin_crm@gmail.com'], 
            [ 
                'name' => 'Super Admin',
                'password' => bcrypt('12345678'), 
            ]
        );
        $user->assignRole($role3);
    }
}